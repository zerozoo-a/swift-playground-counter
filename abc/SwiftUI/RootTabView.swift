//
//  RootTabView.swift
//  abc
//
//  Created by zoo on 3/21/26.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            HomeSwiftUIView()
                .tabItem { Label("Home", systemImage: "house") }
        }
    }
}

#Preview {
    RootTabView()
}
