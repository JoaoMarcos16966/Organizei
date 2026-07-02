import SwiftUI
import Observation
import AVFoundation

enum TimerMode: Int, Sendable {
    case free, pomodoro, countdown
}

enum TimerState: Int, Sendable {
    case idle, running, paused
}

final class SoundManager {
    static let shared = SoundManager()
    private var player: AVAudioPlayer?
    
    func playAlarm() {
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else {
            AudioServicesPlaySystemSound(1109)
            return
        }
        try? AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
        try? AVAudioSession.sharedInstance().setActive(true)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}

@Observable
final class TimeManager {
    var mode: TimerMode = .free { didSet { reset() } }
    var state: TimerState = .idle
    var elapsed: TimeInterval = 0
    
    var hSelected = 0
    var mSelected = 5
    var sSelected = 0
    
    private var timer: Timer?
    
    var duration: TimeInterval {
        switch mode {
        case .free: return 0
        case .pomodoro: return 25 * 60
        case .countdown: return TimeInterval((hSelected * 3600) + (mSelected * 60) + sSelected)
        }
    }
    
    var progress: Double {
        guard mode != .free, duration > 0 else { return 1.0 }
        return max(0, 1.0 - (elapsed / duration))
    }
    
    var timeString: String {
        let total = mode == .free ? Int(elapsed) : max(0, Int(duration) - Int(elapsed))
        let h = total / 3600
        let m = (total % 3600) / 60
        let s = total % 60
        
        return h > 0 || mode == .countdown ? String(format: "%01d:%02d:%02d", h, m, s) : String(format: "%02d:%02d", m, s)
    }
    
    func toggle() {
        if state == .running {
            state = .paused
            timer?.invalidate()
        } else {
            if mode == .countdown && duration == 0 { return }
            state = .running
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                guard let self else { return }
                self.elapsed += 1
                if self.mode != .free && self.elapsed >= self.duration {
                    SoundManager.shared.playAlarm()
                    self.reset()
                }
            }
        }
    }
    
    func reset() {
        state = .idle
        elapsed = 0
        timer?.invalidate()
        timer = nil
    }
}

struct Pomodoro: View {
    @State private var manager = TimeManager()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Picker("Modo", selection: $manager.mode) {
                    Text("Livre").tag(TimerMode.free)
                    Text("Pomodoro").tag(TimerMode.pomodoro)
                    Text("Timer").tag(TimerMode.countdown)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 32)
                .padding(.top, 20)
                .disabled(manager.state != .idle)
                .opacity(manager.state == .idle ? 1.0 : 0.3)
                
                Spacer()
                
                if manager.mode == .countdown && manager.state == .idle {
                    HStack(spacing: 0) {
                        wheel(title: "h", range: 0...23, selection: $manager.hSelected)
                        wheel(title: "min", range: 0...59, selection: $manager.mSelected)
                        wheel(title: "seg", range: 0...59, selection: $manager.sSelected)
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 280)
                } else {
                    ZStack {
                        Circle()
                            .stroke(.black.opacity(0.08), lineWidth: 8)
                        
                        Circle()
                            .trim(from: 0, to: manager.progress)
                            .stroke(
                                LinearGradient(colors: manager.mode == .countdown ? [.orange, .yellow] : [.blue, .cyan], startPoint: .top, endPoint: .bottom),
                                style: StrokeStyle(lineWidth: 8, lineCap: .round)
                            )
                            .rotationEffect(.degrees(-90))
                            .animation(.linear(duration: 1.0), value: manager.elapsed)
                        
                        Text(manager.timeString)
                            .font(.system(size: 54, weight: .light, design: .monospaced))
                            .foregroundColor(.orange)
                    }
                    .frame(width: 280, height: 280)
                }
                
                Spacer()
                
                HStack {
                    actionButton(
                        title: manager.state == .paused ? "Cancelar" : "Voltar",
                        bg: manager.state == .idle ? .orange.opacity(0.20) : .black.opacity(0.15),
                        fg: manager.state == .idle ? .orange : .black,
                        disabled: manager.state == .idle,
                        action: manager.reset
                    )
                    
                    Spacer()
                    
                    let isRunning = manager.state == .running
                    let orangeStyle = isRunning || manager.mode == .countdown
                    
                    actionButton(
                        title: isRunning ? "Pausar" : "Iniciar",
                        bg: orangeStyle ? .orange.opacity(0.15) : .blue.opacity(0.15),
                        fg: orangeStyle ? .orange : .blue,
                        disabled: false,
                        action: manager.toggle
                    )
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            }
        }
    }
    
    private func wheel(title: String, range: ClosedRange<Int>, selection: Binding<Int>) -> some View {
        HStack(spacing: 0) {
            Picker("", selection: selection) {
                ForEach(range, id: \.self) { value in
                    Text("\(value)")
                        .font(.title3)
                        .foregroundColor(.primary) // Alinhado para usar a cor padrão do sistema (preto no modo claro)
                        .tag(value)
                }
            }
            .pickerStyle(.wheel)
            .environment(\.colorScheme, .light) // Mudado para light para os números aparecerem no fundo branco
            
            Text(title)
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.6)) // Corrigido para dar leitura sobre o fundo branco
                .padding(.trailing, 4)
        }
    }
    
    private func actionButton(title: String, bg: Color, fg: Color, disabled: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Circle()
                .fill(bg)
                .frame(width: 76, height: 76)
                .overlay(Text(title).font(.callout).fontWeight(.medium).foregroundColor(fg))
        }
        .disabled(disabled)
    }
}

#Preview {
    Pomodoro()
}
