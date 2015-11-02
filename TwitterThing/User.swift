import Foundation
import UIKit

class User {
    let username: String
    let profileImageUrl: String
    var image: UIImage?
    
    init(username: String, profileImageUrl: String){
        self.username = username
        self.profileImageUrl = profileImageUrl
    }
}