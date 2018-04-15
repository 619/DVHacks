//
//  LoginViewController.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-14.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

//    @IBOutlet weak var userField: UITextField!
//    @IBOutlet weak var userField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var userField: UITextField!
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBAction func registerTouchUpInside(_ sender: Any) {

        Auth.auth().createUser(withEmail: userField.text!, password: passField.text!, completion: { (user, error) in
            if error == nil {
                let userInfo = ["email" : self.userField.text!, "password" : self.passField.text!]
                UserDefaults.standard.set(userInfo, forKey: "userInformation")
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SurveyVC") as! SurveyVC
                self.present(vc, animated: false, completion: nil)

            }

    }
        )
    }
    
    @IBAction func loginTouchUpInside(_ sender: Any) {
        Auth.auth().signIn(withEmail: userField.text!, password: passField.text!, completion: { (user, error) in
            if error == nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.present(vc, animated: false, completion: nil)
                
            }
            
        }
        )
}
    


}

