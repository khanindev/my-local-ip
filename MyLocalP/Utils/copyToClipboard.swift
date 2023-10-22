//
//  copyToClipboard.swift
//  MyLocalP
//
//  Created by Dmitriy Khanin on 22.10.23..
//

import Foundation
import SwiftUI

func copyToClipboard(text: String) -> Void {
    let pasteboard = NSPasteboard.general
    pasteboard.declareTypes([.string], owner: nil)
    pasteboard.setString(text, forType: .string)
}
