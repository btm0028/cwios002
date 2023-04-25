//
//  MessageModel.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/5/23.
//

import Foundation

struct MessageModel : Codable, Identifiable {
    let id: String
    let senderId: String
    let content: String
}

