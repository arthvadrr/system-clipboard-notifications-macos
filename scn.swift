#!/usr/bin/swift

import SwiftUI
import AppKit

print(NSPasteboard.general.clearContents())

NotificationCenter.default.addObserver(self, selector: #selector(clipboardChanged),
                                               name: NSPasteboard.changedNotification, object: nil)