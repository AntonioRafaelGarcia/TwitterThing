import Foundation

class User {
    let username: String
    let profileImageUrl: String
    
    init(username: String, profileImageUrl: String){
        self.username = username
        self.profileImageUrl = profileImageUrl
    }
}