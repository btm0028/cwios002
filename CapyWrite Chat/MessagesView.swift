//
//  MessagesView.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/2/23.
//

import SwiftUI

struct TheirMessage: View {
    var content: String
    
    var body: some View {
        HStack {
            Text(content)
                .padding(7)
                .frame(width: 215)
                .foregroundColor(Color.black)
                .background(Color.gray)
                .cornerRadius(12)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
       
        
    }
}

struct MyMessage: View {
    var content: String
    
    var body: some View {
        
            HStack {
                Spacer()
                Text(content)
                    .padding(7)
                    .frame(width: 215)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        
     
    }
}

struct MessagesView: View {
    var id = ""
    @ObservedObject var messagesvm = MessagesViewModel()
    
    @State private var message: String = "";
    @State private var prev: String = "";
    @State private var showRecipientView: Bool = false;
    @State private var showAccountView: Bool = false;
    
    var body: some View {
        
        if (showRecipientView) {
            RecipientsView()
                .transition(.slide)
        }
        else if (showAccountView) {
            AccountSettingsView()
                .transition(.backslide)
        }
        else {

            ZStack {
                Color.indigo
                    .ignoresSafeArea()
                VStack {
                        HStack {
                            HStack {
                                Image(systemName: "chevron.backward")
                                Text("Back")
                            }
                            .onTapGesture {
                                withAnimation {
                                    showRecipientView.toggle()
                                }
                                
                            }
                            .frame(alignment: .leading)
                            Spacer()
                        }
                        .padding()
                        
                    
                        
                    AsyncImage(url: URL(string: "https://capywritestorage.blob.core.windows.net/profilepics/" + (messagesvm.sender.first?.id ?? "") + ".jpeg?sp=r&st=2023-03-15T02:37:57Z&se=2023-12-14T11:37:57Z&spr=https&sv=2021-12-02&sr=c&sig=A9u1nu716lMsZnjtG%2B6lKrcV7BZEoLoy6GK96Su8bWg%3D")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 75, maxHeight: 75)
                            .clipShape(Circle())
                        }
                        placeholder: {
                            ProgressView()
                        }
                    Text("@" + (messagesvm.sender.first?.username ?? ""))
                            .fontWeight(.bold)
                        VStack {
                            ScrollView(showsIndicators: false) {
                                ForEach(messagesvm.messages) { message in
                                    if (messagesvm.id == message.senderId) {
                                        TheirMessage(content: message.content)
                                            .rotationEffect(Angle(degrees: 180))
                                            .scaleEffect(x: -1, y: 1, anchor: .center)
                                    }
                                    else {
                                        MyMessage(content: message.content)
                                            .rotationEffect(Angle(degrees: 180))
                                            .scaleEffect(x: -1, y: 1, anchor: .center)
                                    }
                                }
                                
                            }
                            .rotationEffect(Angle(degrees: 180))
                            .scaleEffect(x: -1, y: 1, anchor: .center)
                            .padding()
                            .onAppear {
                                messagesvm.id = id
                                messagesvm.grabMessages()
                            }
                            .refreshable() {
                                messagesvm.id = id
                                messagesvm.grabMessages()
                            }
                            
                            
                            
                            
                            VStack {
                                HStack {
                                    TextField(
                                        "Send Your Message",
                                        text: $message,
                                        prompt: Text("Send Message...")
                                    )
                                    .textInputAutocapitalization(.never)
                                    .disableAutocorrection(true)
                                    .border(.secondary)
                                    .background(Color.white)
                                
                                        
                                    Group {
                                        Image(systemName: "paperplane.circle.fill")
                                            .resizable()
                                            
                                    }
                                    .background(Color.blue)
                                    .frame(width: 30, height: 30)
                                    .border(.secondary)
                                    .clipShape(Circle())
                                    .padding()
                                    
                                }
                                .frame(width: 250, height: 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                                .padding()
                            }
                            .background(Color.gray)
                            
                        }
                        .frame(width: 400)
                        .frame(maxHeight: .infinity)
                        .background(Color.white)
                        
                    }
                
            }
            
        }}
}

