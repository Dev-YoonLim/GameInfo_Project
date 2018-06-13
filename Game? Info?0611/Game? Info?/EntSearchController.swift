//
//  EntSearchController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 5. 28..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit

class EntSearchController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var url : String = "http://www.grac.or.kr/WebService/GameSearchSvc.asmx/game?gametitle=&"
    var segueurl : String = "&display=1000&pageno=1&rateno="
    
    var entname = " "
    var entname_utf8 = " "
    
    @IBAction func cancle2ToTextFieldController(segue: UIStoryboardSegue){
        
    }
    
    
    @IBOutlet weak var entPick: UIPickerView!
    @IBOutlet weak var entSearch: UITextField!
    @IBOutlet weak var ENTlogo: UIImageView!
    @IBAction func SearchStart(_ sender: Any) {
        if entname == ""{
            entname = entSearch.text!
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return entPickData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) -> String?{
        return entPickData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if row == 0{
            entname = "넥슨"
            ENTlogo.image = imageArray[row]
            print(entname)
        }
        else if row == 1{
            entname = "엔씨소프트"
            ENTlogo.image = imageArray[row]
            print(entname)
        }
        else if row == 2{
            entname = "넷마블"
            ENTlogo.image = imageArray[row]
            print(entname)
        }
        else if row == 3{
            entname = "블리자드"
            ENTlogo.image = imageArray[row]
            print(entname)
        }
        else if row == 4{
            entname = "일렉트로닉 아츠"
            ENTlogo.image = imageArray[row]
            print(entname)
        }
        else if row == 5{
            entname = ""
            entname = entSearch.text!
            print(entname)
        }
    }
    
    var entPickData = ["넥슨", "엔씨소프트", "넷마블", "블리자드", "일렉트로닉 아츠", "기타검색"]
    let MAX = 5
    let Column = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["nexon.jpg", "ncsoft.jpg", "netmarble.jpg", "blizzard.jpg", "EA.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.entPick.delegate = self;
        self.entPick.dataSource = self;
        for i in 0..<MAX{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        ENTlogo.image = imageArray[0]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segue2ToTableView"{
            if let navControlloer = segue.destination as? UINavigationController{
                entname_utf8 = entname.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                if let CompanyNameResultController = navControlloer.topViewController as?
                    CompanyNameResultController{
                    CompanyNameResultController.url = url + "entname=" + entname_utf8 + segueurl
                    entname = ""
                    entname_utf8 = ""
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
