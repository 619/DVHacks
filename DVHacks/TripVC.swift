//
//  TripVC.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-15.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import Firebase
class TripVC: UIViewController {

    var objs2 = [TripObj2]()
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    let tripNo =  UserDefaults.standard.integer(forKey: "Key")

    override func viewDidLoad() {
        super.viewDidLoad()
       loaddata()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmTouchUpInside(_ sender: Any) {
        
    }
    
    func loaddata() {
        Database.database().reference().child("posts").observe(.childAdded) { (snapshot:DataSnapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                let captionText = dictionary["caption"] as! String
                let photoUrlString = dictionary["photoUrl"] as! String
                let captionTitle = dictionary["title"] as! String
                let currentSize = dictionary["currsize"] as! Int
                let totalSize = dictionary["totalsize"] as! Int
                let time = dictionary["time"] as! String
                let description = dictionary["description"] as! String

                let tripobj = TripObj2(captionText: captionText, photoUrlString: photoUrlString, titleText: captionTitle, totalSize: totalSize, currentSize: currentSize, description: description, time: time)
                print("hello")
                self.objs2.append(tripobj)
                
                
                self.titleLabel.text = self.objs2[self.tripNo].title
                self.timeLabel.text = self.objs2[self.tripNo].captionTime
                self.descLabel.text = self.objs2[self.tripNo].captionDescription

            }
            
        }
    }
    
    @IBAction func joinButtonTouchUpInside(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpcomingVC") as! UpcomingVC
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
