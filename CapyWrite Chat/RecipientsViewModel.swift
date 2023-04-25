//
//  RecipientsViewModel.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/4/23.
//

import Foundation

class RecipientsViewModel : ObservableObject {
    
    var token: String = UserDefaults.standard.string(forKey: "mcidentity") ?? ""
    var url: String = "https://capywrite.com/mobile-grabrecipients.php?token=" + (UserDefaults.standard.string(forKey: "mcidentity") ?? "")
    
    @Published private(set) var recipientData = [ProfileModel]()
    
    
    func grabRecipients() {
        if let url = URL(string: url) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(ProfileListModel.self, from: data)
                                DispatchQueue.main.async {
                                    self.recipientData = results.profiles
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
