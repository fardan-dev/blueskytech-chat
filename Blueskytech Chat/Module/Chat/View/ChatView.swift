//
//  ChatView.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import SwiftUI

struct ChatView: View {
    @State var text: String = ""
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            TabView {
                VStack {
                    ScrollView {
                        senderBubbleView(message: "Ini adalah bubble untuk sender")
                        
                        
                        receiverBubbleView(messageId: 0, message: "Ini adalah bubble untuk receiver")
                        
                    }
                    .padding()
                }
                .tag(0)
                .onAppear(perform: {
                    print("Enter Page 1")
                })
                
                VStack {
                    ScrollView {
                        senderBubbleView(message: "Ini adalah bubble untuk sender")
                        
                        
                        receiverBubbleView(messageId: 0, message: "Ini adalah bubble untuk receiver")
                        
                    }
                    .padding()
                }
                .tag(1)
                .onAppear(perform: {
                    print("Enter Page 2")
                })
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            ZStack {
                HStack(spacing: 16) {
                    TextField("input message", text: $text)
                        .autocorrectionDisabled()
                    
                    Button {
                        self.text = ""
                    } label: {
                        Text("Send")
                            .fontWeight(.medium)
                            .foregroundStyle(Color.black)
                    }
                    
                }
                .padding()
            }
            .background(.white)
        }
        .background(Color.teal)
    }
}

extension ChatView {
    func senderBubbleView(message: String) -> some View {
        HStack {
            Spacer()
            
            Spacer()
                .frame(minWidth: 0, maxWidth: 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("User Left")
                    .fontWeight(.bold)
                    .font(.caption)
                
                Text(message)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
            }
            .padding(8)
            .background(.white)
            .cornerRadius(12)
        }
    }
    
    func receiverBubbleView(messageId: Int, message: String) -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("User Right")
                        .fontWeight(.bold)
                        .font(.caption)
                    
                    Text(message)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                }
                .padding(8)
                .background(.white)
                .cornerRadius(12)
                
                Spacer()
                    .frame(minWidth: 0, maxWidth: 20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ChatView()
}
