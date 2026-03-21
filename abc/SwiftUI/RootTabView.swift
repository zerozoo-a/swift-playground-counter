//
//  RootAppTabView.swift
//  abc
//
//  Created by zoo on 3/21/26.
//

import SwiftUI

struct RootAppTabView: View {
    @State private var selectedAppTab: AppTab = .home

    var body: some View {
        VStack(spacing: 0) {
            switch selectedAppTab {
            case .home:    HomeSwiftUIView()
            case .counter: CounterSwiftUIView()
            case .todo: TodoSwiftUIView()
        
            }
            
            Button {} label: {
                VStack(spacing: 4) {
                    Text("yes~!")
                }
            }

            Spacer(minLength: 0)
            Divider()
            CustomAppTabBar(selectedAppTab: $selectedAppTab)
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}

enum AppTab {
    case home
    case counter
    case todo
}

struct AppAppTabItem {
    let tab: AppTab
    let icon: String
    let label: String
}


#Preview {
    RootAppTabView()
}
