//
//  DetailSearchController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 5. 28..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit

class DetailSearchController: UIViewController {
    @IBOutlet weak var gName: UITextField!
    @IBOutlet weak var eName: UITextField!
    @IBOutlet weak var yName: UITextField!
    @IBOutlet weak var pName: UITextField!
    @IBAction func dSearch(_ sender: Any) {
        d_gname = gName.text!
        d_ename = eName.text!
        d_yname = yName.text!
        d_pname = pName.text!
    }
    
    var d_gname : String = ""
    var d_ename : String = ""
    var d_yname : String = ""
    var d_pname : String = ""
    
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
