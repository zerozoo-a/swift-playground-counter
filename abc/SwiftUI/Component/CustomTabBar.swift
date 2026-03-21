//
//  CustomAppTabBar.swift
//  abc
//
//  Created by zoo on 3/21/26.
//

import SwiftUI

private let tabItems: [AppAppTabItem] = [
    AppAppTabItem(tab: .home,    icon: "house",       label: "Home"),
    AppAppTabItem(tab: .counter, icon: "plus.circle", label: "Counter"),
    AppAppTabItem(tab: .todo, icon: "checkmark.circle", label: "Todo"),
]

struct CustomAppTabBar: View {
    @Binding var selectedAppTab: AppTab

    var body: some View {
        ZStack(alignment: .bottom){
            HStack(spacing: 0) {
                ForEach(tabItems, id: \.label) { item in
                    Button {
                        selectedAppTab = item.tab
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: selectedAppTab == item.tab ? item.icon + ".fill" : item.icon)
                                .font(.system(size: 22))
                            Text(item.label)
                                .font(.caption2)
                        }
                        .foregroundStyle(selectedAppTab == item.tab ? .blue : .gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                    }
                }
            }
            .padding(.bottom, 20)
            .background(.white)
        }
    }
}

#Preview {
    CustomAppTabBar(selectedAppTab: .constant(.home))
}
