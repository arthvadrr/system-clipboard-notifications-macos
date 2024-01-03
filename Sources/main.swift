import AppKit.NSPasteboard
import Foundation
import AVFoundation

var previousClipboardContent: String?
var audioPlayer: AVAudioPlayer?

func getClipboardContent() -> String? {
    let pasteboard: NSPasteboard = NSPasteboard.general
    return pasteboard.string(forType: .string)
}

if let audioFileURL: URL = Bundle.main.url(forResource: "snip_sound", withExtension: "mp3") {
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
        audioPlayer?.prepareToPlay()
        audioPlayer?.volume = Options.volume
    } catch {
        print("Failed to initialize audio player: \n\(error)")
    }
} else {
    print("Sound file not found.")
}

while true {
    if let currentClipboardContent: String = getClipboardContent() {
        if currentClipboardContent != previousClipboardContent {
            previousClipboardContent = currentClipboardContent

            if let player = audioPlayer, !player.isPlaying {
                player.play()
            }
        }
    }

    sleep(1)
}
