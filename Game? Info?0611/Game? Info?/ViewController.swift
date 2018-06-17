//
//  ViewController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 5. 15..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var GameInfo: UIImageView!
    
    @IBAction func GameS(_ sender: Any) {
        audioController.playerEffect(name: Drill)
    }
    @IBAction func EntS(_ sender: Any) {
        audioController.playerEffect(name: Drill)
    }
    @IBAction func GOtyS(_ sender: Any) {
        audioController.playerEffect(name: Drill)
    }
    @IBAction func DetailS(_ sender: Any) {
        audioController.playerEffect(name: Drill)
    }
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder){
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)

        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

