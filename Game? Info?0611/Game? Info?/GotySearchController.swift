//
//  GotySearchController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 5. 28..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit

class GotySearchController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder){
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    let MAX = 14
    let Column = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["04.jpg", "05.jpg", "06.jpg", "07.jpg", "08.png", "09.jpg", "10.png", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.png", "17.jpg"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return YearData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return YearData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if row == 0{
            Gotygame = "하프라이프2"
            titlelogo.image = imageArray[row]
        }
        else if row == 1{
            Gotygame = "바이오하자드4"
            titlelogo.image = imageArray[row]
        }
        else if row == 2{
            Gotygame = "엘더스크롤4"
            titlelogo.image = imageArray[row]
        }
        else if row == 3{
            Gotygame = "바이오쇼크"
            titlelogo.image = imageArray[row]
        }
        else if row == 4{
            Gotygame = "폴아웃3"
            titlelogo.image = imageArray[row]
        }
        else if row == 5{
            Gotygame = "언차티드2"
            titlelogo.image = imageArray[row]
        }
        else if row == 6{
            Gotygame = "레드데드리뎀션"
            titlelogo.image = imageArray[row]
        }
        else if row == 7{
            Gotygame = "엘더스크롤5"
        }
        else if row == 8{
            Gotygame = "워킹데드시즌1"
        }
        else if row == 9{
            Gotygame = "더라스트오브어스"
        }
        else if row == 10{
            Gotygame = "드래곤에이지:인퀴지션"
        }
        else if row == 11{
            Gotygame = "더위쳐3"
        }
        else if row == 12{
            Gotygame = "언차티드4"
        }
        else if row == 13{
            Gotygame = "젤다의전설:브레스오브더와일드"
        }
        titlelogo.image = imageArray[row]
    }
    @IBAction func Gos(_ sender: Any) {
        audioController.playerEffect(name: Drill)
    }
    
    @IBOutlet weak var titlelogo: UIImageView!
    @IBOutlet weak var YearList: UIPickerView!
    @IBAction func cancle4ToTextFieldController(segue: UIStoryboardSegue){
        
    }
    var YearData = ["2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"]
    var url : String = "http://www.grac.or.kr/WebService/GameSearchSvc.asmx/game?gametitle=[게임물명]&entname=&rateno=&display=10&pageno=1"
    var Gotygame : String = "하프라이프2"
    var Gotygame_utf8 = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.YearList.delegate = self;
        self.YearList.dataSource = self;
        for i in 0..<MAX{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        titlelogo.image = imageArray[0]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "segue4ToTableView"{
            if let navControlloer = segue.destination as? UINavigationController{
                Gotygame_utf8 = Gotygame.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
                if let GotyResultController = navControlloer.topViewController as?
                    GotyResultController{
                    GotyResultController.Gotygame = Gotygame
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
