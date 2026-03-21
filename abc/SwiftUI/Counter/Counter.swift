//
//  Counter.swift
//  abc
//
//  Created by zoo on 3/21/26.
//

import SwiftUI

struct CounterSwiftUIView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 32) {
            Text("\(count)")
                .font(.system(size: 80, weight: .bold))

            HStack(spacing: 40) {
                Button("-") { count -= 1 }
                    .font(.largeTitle).fontWeight(.bold)
                Button("+") { count += 1 }
                    .font(.largeTitle).fontWeight(.bold)
            }
        }
        .navigationTitle("Counter")
    }
}

#Preview {
    NavigationStack {
        CounterSwiftUIView()
    }
}
