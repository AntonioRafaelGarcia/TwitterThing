import Foundation

class Tweet {
    let text: String
    let id: String
    var user: User?
    
    init(text: String, id: String, user: User?){
        self.text = text
        self.id = id
        self.user = user
    }
}