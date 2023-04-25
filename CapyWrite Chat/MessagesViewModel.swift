//
//  MessagesViewModel.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/5/23.
//

import Foundation

class MessagesViewModel : ObservableObject {
    var id = ""
    @Published private(set) var sender = [SenderCardModel]()
    @Published private(set) var messages = [MessageModel]()
    
    @Published private(set) var senderId = ""
    @Published private(set) var senderUsername = ""
    
    private let url = "https://capywrite.com/mobile-grabmessages.php?token=" +  (UserDefaults.standard.string(forKey: "mcidentity") ?? "") + "&id="
    
    func grabMessages() {
        if let url = URL(string: url + String(id)) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(MessageAPIModel.self, from: data)
                                DispatchQueue.main.async {
                                    self.sender = results.profile
                                    self.messages = results.messages
                                }
                            } catch {
                                print(error)
                            }
                        }
                        else {
                            print("ERROR")
                        }
                    }
                    
                }.resume()
        }
    }
    
}
