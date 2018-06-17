//
//  NameSearchController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 5. 27..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit
import AVFoundation
import Speech

class NameSearchController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate, UITextFieldDelegate {
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var RecordCount = 0
    
    var url : String = "http://www.grac.or.kr/WebService/GameSearchSvc.asmx/game?"
    var segueurl : String = "&entname=&display=1000&pageno=1&rateno="

    var gametitle = " "
    var gametitle_utf8 = " "
    
    let MAX = 7
    let Column = 1
    var imageArray = [UIImage?]()
    var imageFileName = ["그림1.png", "그림2.png", "그림3.png", "그림4.png", "그림5.png", "그림6.png", "그림7.png"]
    var randomNo: Int = Int(arc4random_uniform(7))
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder){
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }

    
    @IBOutlet weak var Record: UIButton!
    @IBAction func RecordAudio(_ sender: Any) {
        audioController.playerEffect(name: Drill)
        if RecordCount == 0{
            audioRecorder?.record()
            RecordCount = 1
            Record.setTitle("Stop", for: .disabled)
        }
        else if RecordCount == 1{
            audioRecorder?.stop()
            RecordCount = 0
        }
    }
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var GameSearch: UITextField!
    @IBAction func SearchStart(_ sender: Any) {
        audioController.playerEffect(name: Drill)
        gametitle = GameSearch.text!
        //pirnt(GameSearch.text)
        print(gametitle)
    }
    @IBAction func cancleToTextFieldController(segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var transcribeButton: UIButton!
    @IBAction func transcribeAudio(_ sender: Any){
        audioController.playerEffect(name: Drill)
        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: (audioRecorder?.url)!)
        recognizer?.recognitionTask(with: request, resultHandler: {
            (resut, error) in
            self.GameSearch.text = resut?.bestTranscription.formattedString
        })
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        record()
        GameSearch.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_sender:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_sender:)), name: .UIKeyboardWillHide, object: nil)
        for i in 0..<MAX{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        logo.image = imageArray[randomNo]
        //chimage()

        // Do any additional setup after loading the view.
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
                    GameNameResultController.GameName = gametitle
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
