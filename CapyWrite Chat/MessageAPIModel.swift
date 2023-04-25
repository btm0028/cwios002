//
//  MessageAPIModel.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/5/23.
//

import Foundation

struct MessageAPIModel : Codable {
    let profile: [SenderCardModel]
    let messages: [MessageModel]

}
