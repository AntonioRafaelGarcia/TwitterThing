import Foundation
import Accounts

class LoginService {
    class func loginTwitter (completionHandler: (String?, ACAccount?) -> ()) {
        
        //Set up Account Store
        let accountStore = ACAccountStore()
        
        //Account type
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        //Closure
        accountStore.requestAccessToAccountsWithType(accountType, options: nil, completion: { (granted, error) -> Void in
            
            if let _ = error {
                completionHandler("ERROR: Something bad happened", nil); return
            }
            
            if granted {
                if let account = accountStore.accountsWithAccountType(accountType).first as? ACAccount {
                    completionHandler(nil, account); return
                }
                
                completionHandler("ERROR: No device? (uptalk)", nil); return
            }
            
            // user denies access
            completionHandler("ERROR: You said nah.", nil); return
        })
    }
}