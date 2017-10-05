//
//  AuthViewController.swift
//  apple_tutorial
//
//  Created by 大友一樹 on 2017/10/05.
//  Copyright © 2017年 大友一樹. All rights reserved.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {
    
    // Propaties
    let BTN_IN = 0
    let BTN_UP = 1
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
   
    @IBOutlet weak var signIn: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        password.isSecureTextEntry = true

        // Do any additional setup after loading the view.
        self.signIn.tag = BTN_IN
        self.signUp.tag = BTN_UP
        self.signIn.addTarget(self, action: #selector(AuthViewController.onClick(sender:)), for: .touchUpInside)
        self.signUp.addTarget(self, action: #selector(AuthViewController.onClick(sender:)), for: .touchUpInside)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onClick (sender:UIButton){
        if sender.tag == BTN_IN {
            Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: { user, error in
                if let error = error {
                    print("サインインできません \(error)")
                    return
                }
                if let user = user {
                    print("user : \(user.email!) サインインできました")
                    
                    let storyboard: UIStoryboard = self.storyboard!
                    let nextView = storyboard.instantiateViewController(withIdentifier: "next") as! UINavigationController
                    self.present(nextView, animated: true, completion: nil)
                }
            })
        }else if sender.tag == BTN_UP {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: { user, error in
                if let error = error {
                    print("ユーザーを作れませんでした \(error)")
                    return
                }
                if let user = user {
                    print("user : \(user.email!)ユーザーを作成しました")
                }
            })
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
