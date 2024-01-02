import AppKit.NSPasteboard
import Foundation
import AVFoundation

func getClipboardContent() -> String? {
    let pasteboard: NSPasteboard = NSPasteboard.general
    return pasteboard.string(forType: .string)
}

var previousClipboardContent: String?
var audioPlayer: AVAudioPlayer?

if let audioFileURL = Bundle.main.url(forResource: "snip_sound", withExtension: "mp3") {
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
        audioPlayer?.prepareToPlay()
    } catch {
        print("Failed to initialize audio player: \(error)")
    }
} else {
    print("Sound file not found.")
}

while true {
    if let currentClipboardContent: String = getClipboardContent() {
        if currentClipboardContent != previousClipboardContent {
            previousClipboardContent = currentClipboardContent

            // Ensure audio player is not nil before attempting to play
            if let player = audioPlayer, !player.isPlaying {
                player.play()
            }
        }
    }

    sleep(1)
}
