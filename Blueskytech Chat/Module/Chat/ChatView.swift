//
//  ChatView.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        TabView {
            VStack {
                Text("Halaman 1")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image(systemName: "1.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .background(Color.red.opacity(0.2))
            .cornerRadius(10)
            .padding()
            
            VStack {
                Text("Halaman 2")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image(systemName: "2.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            .padding()
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    ChatView()
}
