//
//  LoginViewController.swift
//  apple_tutorial
//
//  Created by 大友一樹 on 2017/10/07.
//  Copyright © 2017年 大友一樹. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    // Login method
    @IBAction func handleLoginButton(_ sender: Any) {
        if let address = mailAddressTextField.text, let password = passwordTextField.text {
            
            // Blank validation
            if address.characters.isEmpty || password.characters.isEmpty {
                return
            }
            
            Auth.auth().signIn(withEmail: address, password: password) { user, error in
                if let error = error {
                    print("firebase error, login:" + error.localizedDescription)
                    return
                }else {
                    print("login ok")
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    
    
    }
    
    // Signup method
    @IBAction func handleCreateAcountButton(_ sender: Any) {
        if let address = mailAddressTextField.text, let password = passwordTextField.text {
            if address.characters.isEmpty || password.characters.isEmpty {
                print("blank input for sign up")
                return
            }
            
            Auth.auth().createUser(withEmail: address, password: password) {user, error in
                print("user signup error:",error)
                return
            }
            
            print("user create: ok")
            self.dismiss(animated: true, completion: nil)
            
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
