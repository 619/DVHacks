//
//  TripsVC.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-14.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class TripsVC: UIViewController {

    @IBOutlet weak var segMenuView: HBSegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        segMenuView.items = ["Weekly", "Fornightly", "Monthly"]
        segMenuView.borderColor = .clear
        segMenuView.selectedLabelColor = .white
        segMenuView.unselectedLabelColor = .red
        segMenuView.backgroundColor = .lightGray
        segMenuView.thumbColor = .black
        segMenuView.selectedIndex = 1
       // segMenuView.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)

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
