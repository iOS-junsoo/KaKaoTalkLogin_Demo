//
//  ViewController.swift
//  KaKaoTalkLogin_Demo
//
//  Created by 준수김 on 2021/10/12.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
           if let error = error {
               print(error)
           }
           else {
               print("loginWithKakaoAccount() success.")
                _ = oauthToken
         }
     }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
}

