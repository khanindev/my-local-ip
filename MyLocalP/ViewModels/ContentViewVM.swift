//
//  contentViewModel.swift
//  MyLocalP
//
//  Created by Dmitriy Khanin on 22.10.23..
//

import SwiftUI
import Foundation
import AppKit

class ContentViewVM: ObservableObject {
    let ipAddress: String = getIPAddress()
    var isShowingCopyPopover = true;
    
    func showPopover() -> Void {
        self.isShowingCopyPopover = true;
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isShowingCopyPopover = false
        }
    }
    
    func handleCopyClick() -> Void {
        copyToClipboard(text: self.ipAddress)
    }
    
    func handleCloseClick() -> Void {
        NSApplication.shared.terminate(self)
    }
}
