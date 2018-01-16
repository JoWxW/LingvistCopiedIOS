//
//  SecondViewController.swift
//  Lingvist
//
//  Created by Xiaowen WANG on 2018/1/15.
//  Copyright © 2018年 Xiaowen WANG. All rights reserved.
//

import UIKit
import SQLite

class CompteViewController: UIViewController {

    var database: Connection!
    
    let usersTable = Table("users")
    //clones of SQLite specifies by Expressions
    let id = Expression<Int>("id")
    let email = Expression<String>("email")
    let password = Expression<String>("password")
    
    var idCompte : Int = 0
    var emailCompte : String = ""
    
    @IBOutlet weak var profile: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var close: UIButton!
    @IBAction func buttonclose() {
        hideProfile(hide: true)
    }
    
    @IBAction func buttonSignIn() {
        print("Buton Sign In")
        let alert = UIAlertController(title:"Sign In", message:nil, preferredStyle: .alert)
        alert.addTextField{(tf)in tf.placeholder = "Email"}
        alert.addTextField{(tf)in tf.placeholder = "Password"}
        let action = UIAlertAction(title:"Submit", style:.default){(_)in
            guard
                let emailSaisir = alert.textFields?.first?.text,
                let passwordSaisir = alert.textFields?.last?.text
                else{return}
            print(emailSaisir)
            print(passwordSaisir)
            let compte1 = self.usersTable.filter(self.email == emailSaisir)
            let compte2 = self.usersTable.filter(passwordSaisir == self.password)
            print(compte1)
            print(compte2)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonOut() {
        self.idCompte = 0
        self.emailCompte = ""
    }
    @IBAction func list() {
        print("List compte")
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users{
                print("userID: \(user[self.id]), name: \(user[self.email])")
            }
            if self.emailCompte == ""{
                self.profileEmail.text = ""
            }else{
                self.profileEmail.text = self.emailCompte
            }
            self.hideProfile(hide: false)
        } catch  {
            print(error)
        }
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
            
            let buttonSignUp = self.usersTable.insert(self.email <- email, self.password <- password)
            
            do{
                self.idCompte = try Int(self.database.run(buttonSignUp))
                print("inserted user")
                self.hideProfile(hide: false)
                self.emailCompte = email
                self.profileEmail.text = email
            }catch{
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hideProfile(hide: true)
        initialiserDB()
        createTables()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideProfile(hide: Bool){
        profile.isHidden = hide
        profileImg.isHidden = hide
        profileEmail.isHidden = hide
        viewProfile.isHidden = hide
        close.isHidden = hide
    }
    
    func initialiserDB(){
        do{
            let documentDirectory = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("LingvistiOS").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
        }catch{
            print(error)
        }
    }
    
    func createTables(){
        print("Create Tables Users")
        
        let createUsersTable = self.usersTable.create{(table) in
            table.column(self.id, primaryKey: true)
            table.column(self.email, unique: true)
            table.column(self.password)
        }
        
        do {
            try self.database.run(createUsersTable)
            print("Created Users Table")
        } catch  {
            print(error)
        }
    }
}

