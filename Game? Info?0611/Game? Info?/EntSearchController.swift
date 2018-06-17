//
//  EntSearchController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 5. 28..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit
import AVFoundation
import Speech
class EntSearchController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var url : String = "http://www.grac.or.kr/WebService/GameSearchSvc.asmx/game?gametitle=&"
    var segueurl : String = "&display=1000&pageno=&rateno="
    
    var entname = " "
    var entname_utf8 = " "
    var RecordCount = 0
    
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder){
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func cancle2ToTextFieldController(segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var Record: UIButton!
    @IBAction func RecordAudio(_ sender: Any) {
        audioController.playerEffect(name: Drill)
        if RecordCount == 0{
            audioRecorder?.record()
            RecordCount = 1
        }
        else if RecordCount == 1{
            audioRecorder?.stop()
            RecordCount = 0
        }
    }
    @IBOutlet weak var transcribeButton: UIButton!
    @IBAction func transcribeAudio(_ sender: Any){
        audioController.playerEffect(name: Drill)
        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: (audioRecorder?.url)!)
        recognizer?.recognitionTask(with: request, resultHandler: {
            (resut, error) in
            self.entSearch.text = resut?.bestTranscription.formattedString
        })
    }
    @IBOutlet weak var entPick: UIPickerView!
    @IBOutlet weak var entSearch: UITextField!
    @IBOutlet weak var ENTlogo: UIImageView!
    @IBAction func SearchStart(_ sender: Any) {
        audioController.playerEffect(name: Drill)
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
        record()
        self.entPick.delegate = self;
        self.entPick.dataSource = self;
        for i in 0..<MAX{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        ENTlogo.image = imageArray[0]

        // Do any additional setup after loading the view.
        entSearch.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_sender:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_sender:)), name: .UIKeyboardWillHide, object: nil)
    }
    func authorizeSR(){
        SFSpeechRecognizer.requestAuthorization{ authStatus in
            OperationQueue.main.addOperation {
                switch authStatus{
                case .authorized:
                    self.transcribeButton.isEnabled = true
                case .denied:
                    self.transcribeButton.isEnabled = false
                    self.Record.setTitle("Speech recognition access denied by user", for: .disabled)
                case .restricted:
                    self.transcribeButton.isEnabled = false
                    self.transcribeButton.setTitle("Speech recognition access restricted on device", for: .disabled)
                case .notDetermined:
                    self.transcribeButton.isEnabled = false
                    self.transcribeButton.setTitle("Speech recognition not authorized", for: .disabled)
                }
            }
        }
    }
    func record(){
        let fileMgr = FileManager.default
        let dirParhs = fileMgr.urls(for: .documentDirectory, in: .userDomainMask)
        let soundFileURL = dirParhs[0].appendingPathComponent("sound.caf")
        let recordSettings = [AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue, AVEncoderBitRateKey: 16, AVNumberOfChannelsKey: 2, AVSampleRateKey: 44100.0] as [String : Any]
        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        }catch let error as NSError {
            print("audioSession error: \(error.localizedDescription)")
        }
        do {
            try audioRecorder = AVAudioRecorder(url: soundFileURL, settings: recordSettings as [String : AnyObject])
            audioRecorder?.prepareToRecord()
        }catch let error as NSError{
            print("audioSession error: \(error.localizedDescription)")
        }
        authorizeSR()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func keyboardWillShow(_sender: Notification){
        self.view.frame.origin.y -= 150
    }
    @objc func keyboardWillHide(_sender: Notification){
        self.view.frame.origin.y = 0
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
