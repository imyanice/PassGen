//
//  PassGenApp.swift
//  PassGen
//
//  Created by Yanice :) on 4/24/23.
//

import SwiftUI
import AppKit

@main
struct PassGenApp: App {
    
  func genPass() {
    let letters =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~0123456789"

    NSPasteboard.general.clearContents()
    NSPasteboard.general.setString(
      String((0..<20).map { _ in letters.randomElement()! }),
      forType: NSPasteboard.PasteboardType.string)
  }
    func openGithub () {
        guard let githubUrl = URL(string: "https://github.com/yan-jobs") else {return}
        NSWorkspace.shared.open(githubUrl)
    }
  var body: some Scene {
      
    MenuBarExtra {
        let _ = NSApplication.shared.setActivationPolicy(.prohibited)
        Label("PassGen", systemImage: "key.horizontal")
        Button(action: genPass) {
            Label("Generate", systemImage: "plus.square")
        }
        Divider()
        Button("Made by Yan :)", role: .none, action: openGithub)
        Button("Quit", role: .destructive) {
        exit(0)
      }

    } label: {
      Label("PassGen", systemImage: "key.viewfinder")
    }
  }
}


