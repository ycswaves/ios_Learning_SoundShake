//
//  ViewController.swift
//  SoundShake
//
//  Created by YCS on 11/4/15.
//  Copyright (c) 2015 ycswaves. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    let sounds = ["870-12Gauge", "AK47", "M16", "Mk19"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if event.subtype == UIEventSubtype.MotionShake {
            var rdNum = Int(arc4random_uniform(UInt32(sounds.count)))
            var fileLoc = NSBundle.mainBundle().pathForResource(sounds[rdNum], ofType: "mp3")
            var err: NSError? = nil
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLoc!), error: &err)
            player.play()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

