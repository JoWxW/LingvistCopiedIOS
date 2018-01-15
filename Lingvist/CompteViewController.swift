//
//  SecondViewController.swift
//  Lingvist
//
//  Created by Xiaowen WANG on 2018/1/15.
//  Copyright © 2018年 Xiaowen WANG. All rights reserved.
//

import UIKit

class CompteViewController: UIViewController {

    @IBAction func buttonSignIn() {
        print("Buton Sign In")
        let alert = UIAlertController(title:"Sign In", message:nil, preferredStyle: .alert)
        alert.addTextField{(tf)in tf.placeholder = "Email"}
        alert.addTextField{(tf)in tf.placeholder = "Password"}
        let action = UIAlertAction(title:"Submit", style:.default){(_)in
            guard
                let email = alert.textFields?.first?.text,
                let password = alert.textFields?.last?.text
                else{return}
            print(email)
            print(password)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func buttonSignUp() {
        print("Buton Sign Up")
        let alert = UIAlertController(title:"Sign Up", message:nil, preferredStyle: .alert)
        alert.addTextField{(tf)in tf.placeholder = "Email"}
        alert.addTextField{(tf)in tf.placeholder = "Password"}
        let action = UIAlertAction(title:"Submit", style:.default){(_)in
            guard
                let email = alert.textFields?.first?.text,
                let password = alert.textFields?.last?.text
                else{return}
            print(email)
            print(password)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
