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
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Equals = "="
        case Empty = "Empty"
    }
  
    @IBOutlet weak var CalkReadout: UILabel!
    
 
    var btnSound: AVAudioPlayer!
    
    var runningNumber: String = ""
    var leftValString = ""
    var rightValString = ""
    var currentOperation: Operation = Operation.Empty
    // Pick back up at 22 min 47 seconds in lecture.

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
        btnSound.play()
        
        runningNumber += "\(Button.tag)"
        CalkReadout.text = runningNumber
    }

    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
   
    @IBAction func onAddPressed(sender: UIButton) {
        processOperation(Operation.Add)
    }

    @IBAction func onEqualsPressed(sender: AnyObject) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(op: Operation) {
        
    }
}

// 37:52 on vid