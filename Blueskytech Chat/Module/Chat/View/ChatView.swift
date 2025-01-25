//
//  ChatView.swift
//  Blueskytech Chat
//
//  Created by Muhamad Fardan Wardhana on 25/01/25.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var presenter: ChatPresenter
    
    @State private var text: String = ""
    @State private var selectedTab = 0
    @State private var currentUser: String = "left"
    
    var body: some View {
        VStack {
            TabView {
                VStack {
                    ScrollView {
                        ForEach(presenter.chatsModel, id: \.id) { chat in
                            if chat.isUserSender {
                                senderBubbleView(user: chat.user, message: chat.message)
                            } else {
                                receiverBubbleView(user: chat.user, message: chat.message)
                            }
                        }
                    }
                    .padding()
                }
                .tag(0)
                .onAppear(perform: {
                    presenter.getChats(user: "left")
                    currentUser = "left"
                })
                
                VStack {
                    ScrollView {
                        ForEach(presenter.chatsModel, id: \.id) { chat in
                            if chat.isUserSender {
                                senderBubbleView(user: chat.user, message: chat.message)
                            } else {
                                receiverBubbleView(user: chat.user, message: chat.message)
                            }
                        }
                    }
                    .padding()
                }
                .tag(1)
                .onAppear(perform: {
                    presenter.getChats(user: "right")
                    currentUser = "right"
                })
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            ZStack {
                HStack(spacing: 16) {
                    TextField("input message", text: $text)
                        .autocorrectionDisabled()
                    
                    Button {
                        presenter.addChat(user: currentUser, message: text)
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
        .onAppear(perform: {
            presenter.getChats(user: "left")
        })
    }
}

extension ChatView {
    func senderBubbleView(user: String, message: String) -> some View {
        HStack {
            Spacer()
            
            Spacer()
                .frame(minWidth: 0, maxWidth: 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(user)
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
    
    func receiverBubbleView(user: String, message: String) -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(user)
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
