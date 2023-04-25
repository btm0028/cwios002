//
//  SenderCardModel.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/5/23.
//

import Foundation

struct SenderCardModel : Codable, Identifiable {
    let id: String
    let username: String
    let isVerified: String
}
