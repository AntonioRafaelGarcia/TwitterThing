import Foundation

class Tweet {
    let text: String
    let id: String
    let username: String
    let profileImageUrl: String
    
    init(text: String, id: String, username: String, profileImageUrl: String){
        self.text = text
        self.id = id
        self.username = username
        self.profileImageUrl = profileImageUrl
    }
}