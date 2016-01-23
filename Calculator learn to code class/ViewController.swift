//
//  ViewController.swift
//  Calculator learn to code class
//
//  Created by Chad Wollenberg on 1/22/16.
//  Copyright © 2016 Chad Wollenberg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
  
    @IBOutlet weak var CalkReadout: UILabel!
    
    var btnSound: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let path = NSBundle.mainBundle().pathForResource("btn", ofType:"wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        
        
    }

    @IBAction func onNumberPressed(Button: UIButton!) {
        
    }

}

