//
//  pushViewController.swift
//  apple_tutorial
//
//  Created by 大友一樹 on 2017/10/07.
//  Copyright © 2017年 大友一樹. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class pushViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    
    @IBAction func handleSubmit(_ sender: Any) {
        
        if inputText.text != nil {
        // postDataに必要な情報を取得しておく
        let time = NSDate.timeIntervalSinceReferenceDate
        //  let name = Auth.auth()?.currentUser
        
        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child("article")
        let postData = ["caption": inputText.text!, "time": String(time), "name": "testuser"]
        postRef.childByAutoId().setValue(postData)

        } else {
            print("input is null")
            return
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
