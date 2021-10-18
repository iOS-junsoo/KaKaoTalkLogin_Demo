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

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
           if let error = error {
               print(error)
           }
           else {
               //로그인 성공후 사용자 정보 가져오기
               UserApi.shared.me() {(user, error) in
                   if let error = error {
                       print(error)
                   }
                   else {
                       
                       self.userName.text = user?.kakaoAccount?.profile?.nickname!
                       self.userName.sizeToFit()
                       let url = user?.kakaoAccount?.profile?.profileImageUrl
                       let data = try? Data(contentsOf: url!)
                       self.userImage.image = UIImage(data: data!)
                       print("asd")

                       _ = user
                   }
               }
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

