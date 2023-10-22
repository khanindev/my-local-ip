//
//  contentViewModel.swift
//  MyLocalP
//
//  Created by Dmitriy Khanin on 22.10.23..
//

import Foundation

class ContentViewVM: ObservableObject {
    let ipAddress: String = getIPAddress()
    
    func handleCopyClick() -> Void {
        copyToClipboard(text: self.ipAddress)
    }
}
