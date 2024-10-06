import Foundation
import AVFAudio

class MusicManager {
    static let shared = MusicManager()
    
    private var audioPlayer: AVAudioPlayer?
    
    private init() {}
    
    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print("Error music download")
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
    }
    
    func pauseBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
    }
    
    func resumeBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        guard let musicOn = storage.getBool(forKey: .musicOn) else { return }
        
        if !audioPlayer.isPlaying && musicOn {
            audioPlayer.play()
        }
    }
}
