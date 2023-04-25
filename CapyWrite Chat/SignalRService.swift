import Foundation
import SignalRClient


class SignalRService : ObservableObject {
    private var connection: HubConnection
    
    public init() {
        let url = "https://millerchat.azurewebsites.net/liveHub"
        connection = HubConnectionBuilder(url: URL(string: url)!)
            .withLogging(minLogLevel: .debug)
            .withHttpConnectionOptions { options in
                options.skipNegotiation = true }
            .build()
        connection.on(method: "ReceiveMsg") {
            (to: String, from: String, content: String) in
            print("COMPLETE")
        }

        connection.start()
        connection.invoke(method: "RecordSession",  (UserDefaults.standard.string(forKey: "mcidentity") ?? "")) { error in
            
            print(error ?? "")
        }
        
    }

    
    private func handleMessage(recipient: Int, sender: Int, content: String) {
        print("REACHED" + content)
    }
}
 
