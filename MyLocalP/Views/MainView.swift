//
//  ContentView.swift
//  MyLocalP
//
//  Created by Dmitriy Khanin on 22.10.23..
//

import SwiftUI


struct MainView: View {
    @StateObject private var vm = ContentViewVM()
    
    var body: some View {
        VStack {
            HStack() {
                Text("Local network IP")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.secondary)
                Text(vm.ipAddress).foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.frame(maxWidth: .infinity)
            Divider()
            Button { vm.handleCopyClick() } label: {
                Text("Copy to clipboard")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity).buttonStyle(.borderless)
                .tint(.primary)
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
