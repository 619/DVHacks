//
//  HomeVC.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-14.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import Firebase
import Alamofire


class UpcomingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let imageCache = NSCache<AnyObject, AnyObject>()
    @IBOutlet weak var tableView: UITableView!
    var objs2 = [TripObj2]()
    
    override func viewDidLoad() {
         loadPosts()
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.touched (_:)))
        super.viewDidLoad()
        tableView.dataSource = self
       
        self.tableView.addGestureRecognizer(gesture)

       // var post = Post(captionText: "test", photoUrlString: "test")
        

        // Do any additional setup after loading the view.
    }
    
   
    @objc func touched(_ sender:UITapGestureRecognizer){
        let selected = 0
        UserDefaults.standard.set(selected, forKey: "selected")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Trip2VC")
        self.present(vc!, animated: false, completion: nil)
        print("goodbye")

    }
    
    func loadPosts() {
        Database.database().reference().child("posts").observe(.childAdded) { (snapshot:DataSnapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                let captionText = dictionary["caption"] as! String
                let photoUrlString = dictionary["photoUrl"] as! String
                let captionTitle = dictionary["title"] as! String
                let currentSize = dictionary["currsize"] as! Int
                let totalSize = dictionary["totalsize"] as! Int
                let captionTime = dictionary["time"] as! String
                let description = dictionary["description"] as! String
                
                let tripobj2 = TripObj2(captionText: captionText, photoUrlString: photoUrlString, titleText: captionTitle, totalSize: totalSize, currentSize: currentSize, description: description, time: captionTime)
                print("hello")
                self.objs2.append(tripobj2)
                self.tableView.reloadData()
            }
            
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selected = indexPath.row
        UserDefaults.standard.set(selected, forKey: "selected")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TripVC") as! TripVC
        self.present(vc, animated: false, completion: nil)
        print("goodbye")


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! homeCellTableViewCell
        if objs2.count == 0 || indexPath.row > objs2.count - 1{
            
        } else {
            cell.postCaption?.text = objs2[0].caption
            cell.postTitle.text = objs2[0].title
            
            let remoteImageUrl = URL(string: objs2[0].photoUrl)
            Alamofire.request(remoteImageUrl!).responseData { (response) in
                if response.error == nil {
                    if let data = response.data {
                        cell.postImage.image = UIImage(data: data)
                    }
                }
            }
            cell.postPeople.text = objs2[0].captionTime
            
            
        }
        //     print(posts.count)
        
        return cell
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

