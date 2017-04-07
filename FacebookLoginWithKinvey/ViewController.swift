//
//  ViewController.swift
//  FacebookLoginWithKinvey
//
//  Created by Victor Hugo on 2017-04-07.
//  Copyright © 2017 Kinvey. All rights reserved.
//

import UIKit
import FacebookLogin
import Kinvey

class ViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.delegate = self
        loginButton.center = view.center
        view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: LoginButtonDelegate {
    
    /**
     Called when the button was used to logout.
     
     - parameter loginButton: Button that was used to logout.
     */
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }

    /**
     Called when the button was used to login and the process finished.
     
     - parameter loginButton: Button that was used to login.
     - parameter result:      The result of the login.
     */
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("Login cancelled")
        case .success(_, _, let accessToken):
            User.login(authSource: .facebook, ["access_token" : accessToken.authenticationToken]) { user, error in
                if let user = user {
                    print(user)
                    self.userLabel.text = "User ID: \(user.userId)"
                } else {
                    print(error ?? "unknow error")
                }
            }
        }
    }
    
}
