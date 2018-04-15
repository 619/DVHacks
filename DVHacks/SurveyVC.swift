//
//  SurveyVC.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-14.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SurveyVC: UIViewController {

    var prefArr = [0, 0, 0, 0, 0, 0]
    var oneTouched = false
    var twoTouched = false
    var threeTouched = false
    var fourTouched = false
    var fiveTouched = false
    var sixTouched = false
    @IBOutlet weak var choiceButton6: UIButton!
    @IBOutlet weak var choiceButton5: UIButton!
    @IBOutlet weak var choiceButton4: UIButton!
    @IBOutlet weak var choiceButton3: UIButton!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton1: UIButton!
    
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let userInfo = ["email" : "zhang.bobby98@gmail.com", "password" : "password"]
        UserDefaults.standard.set(userInfo, forKey: "userInformation")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oneTouch(_ sender: Any) {
        if choiceButton1.image(for: .normal) == #imageLiteral(resourceName: "button") {
            oneTouched = true
            choiceButton1.setImage(#imageLiteral(resourceName: "buttonPressed"), for: UIControlState.normal)
        } else {
            oneTouched = false
           choiceButton1.setImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        }
    }
    
    @IBAction func twoTouch(_ sender: Any) {
        if choiceButton2.image(for: .normal) == #imageLiteral(resourceName: "button") {
            twoTouched = true

            choiceButton2.setImage(#imageLiteral(resourceName: "buttonPressed"), for: UIControlState.normal)
        } else {
            twoTouched = false

            choiceButton2.setImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        }
    }
    
    @IBAction func threeTouch(_ sender: Any) {
        if choiceButton3.image(for: .normal) == #imageLiteral(resourceName: "button") {
            threeTouched = true

            choiceButton3.setImage(#imageLiteral(resourceName: "buttonPressed"), for: UIControlState.normal)
        } else {
            threeTouched = false

            choiceButton3.setImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        }
    }
    
    @IBAction func fourTouch(_ sender: Any) {
        if choiceButton4.image(for: .normal) == #imageLiteral(resourceName: "button") {
            fourTouched = true

            choiceButton4.setImage(#imageLiteral(resourceName: "buttonPressed"), for: UIControlState.normal)
        } else {
            fourTouched = false

            choiceButton4.setImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        }
    }
    
    @IBAction func fiveTouch(_ sender: Any) {
        if choiceButton5.image(for: .normal) == #imageLiteral(resourceName: "button") {
            fiveTouched = true

            choiceButton5.setImage(#imageLiteral(resourceName: "buttonPressed"), for: UIControlState.normal)

        } else {
            fiveTouched = false

           choiceButton5.setImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        }
    }
    
    @IBAction func sixTouch(_ sender: Any) {
        if choiceButton6.image(for: .normal) == #imageLiteral(resourceName: "button") {
            sixTouched = true

          choiceButton6.setImage(#imageLiteral(resourceName: "buttonPressed"), for: UIControlState.normal)
        } else {
            sixTouched = false

           choiceButton6.setImage(#imageLiteral(resourceName: "button"), for: UIControlState.normal)
        }
    }
    @IBAction func skipButtonTouchUpInside(_ sender: Any) {
        let userPrefs = ["1" : 0, "2" : 0, "3" : 0, "4" : 0, "5" : 0, "6" : 0]
        UserDefaults.standard.set(userPrefs, forKey: "userPreferences")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.present(vc, animated: false, completion: nil)
        

    }


    
    @IBAction func contTouchUpInside(_ sender: Any) {
        if (oneTouched) {
            prefArr[0] = 1
        }
        if (twoTouched) {
            prefArr[1] = 1
        }
        if (threeTouched) {
            prefArr[2] = 1
        }
        if (fourTouched) {
            prefArr[3] = 1
        }
        if (fiveTouched) {
            prefArr[4] = 1
        }
        if (sixTouched) {
            prefArr[5] = 1
        }
        
        let userPrefs = ["1" : prefArr[1], "2" : prefArr[1], "3" : prefArr[2], "4" : prefArr[3], "5" : prefArr[4], "6" : prefArr[5]]
        UserDefaults.standard.set(userPrefs, forKey: "userPreferences")
        
        let userID = Auth.auth().currentUser?.uid
        Database.database().reference().child("userprefs").child(userID!).setValue(["prefs": userPrefs])
        
                
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.present(vc, animated: false, completion: nil)
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
