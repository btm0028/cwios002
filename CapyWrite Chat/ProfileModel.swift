//
//  ProfileModel.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/4/23.
//

import Foundation

struct ProfileModel : Codable, Identifiable {
    let id: String
    let username: String
    let isVerified: String
    let lastMessage: String
}
