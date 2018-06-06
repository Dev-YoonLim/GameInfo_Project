//
//  NameSearchController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 5. 27..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit

class NameSearchController: UIViewController {
    var url : String = "http://www.grac.or.kr/WebService/GameSearchSvc.asmx/game?"
    var segueurl : String = "&entname=&rateno=&display=1000&pageno=1"

    var gametitle = " "
    var gametitle_utf8 = " "
    
    let MAX = 7
    let Column = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["그림1.png", "그림2.png", "그림3.png", "그림4.png", "그림5.png", "그림6.png", "그림7.png"]
    var randomNo: Int = Int(arc4random_uniform(7))

    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var GameSearch: UITextField!
    @IBAction func SearchStart(_ sender: Any) {
        gametitle = GameSearch.text!
        //pirnt(GameSearch.text)
        print(gametitle)
    }
    @IBAction func cancleToTextFieldController(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<MAX{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        logo.image = imageArray[randomNo]
        //chimage()

        // Do any additional setup after loading the view.
    }
    
    func chimage(){
        for i in 0..<MAX{
            logo.image = imageArray[i]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segueToTableView"{
            if let navControlloer = segue.destination as? UINavigationController{
                gametitle_utf8 = gametitle.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                if let GameNameResultController = navControlloer.topViewController as?
                    GameNameResultController{
                    GameNameResultController.url = url + "gametitle=" + gametitle_utf8 + segueurl
                }
            }
        }
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
