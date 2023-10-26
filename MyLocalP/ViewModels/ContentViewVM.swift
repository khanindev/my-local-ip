//
//  contentViewModel.swift
//  MyLocalP
//
//  Created by Dmitriy Khanin on 22.10.23..
//

import SwiftUI
import Foundation
import Network
import AppKit

class NetworkConenctionStatus {
    private var monitor: NWPathMonitor!

    init(handleSatisfied: @escaping () -> Void, handleDisconnect: @escaping () -> Void) {
        self.monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                handleSatisfied()
            } else {
                handleDisconnect()
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}

class ContentViewVM: ObservableObject {
    @Published var ipAddress: String = "";
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
    
    func setIpAddress() -> Void {
        DispatchQueue.main.async {
            debugPrint("Set ip")
            self.ipAddress =  getIPAddress()
        }
    }
    
    func clearIpAddress() -> Void {
        DispatchQueue.main.async {
            debugPrint("Clear ip")
            self.ipAddress = "Not connected"
        }
    }
    
    func handleCloseClick() -> Void {
        NSApplication.shared.terminate(self)
    }
}
