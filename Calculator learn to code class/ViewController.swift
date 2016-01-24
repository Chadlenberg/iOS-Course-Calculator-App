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
    var result = ""
    var currentOperation: Operation = Operation.Empty

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
        playSound()
        runningNumber += "\(Button.tag)"
        CalkReadout.text = runningNumber
    }

    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
   
    @IBAction func onSubtractPressed(sender: UIButton) {
        processOperation(Operation.Subtract)
    }

    @IBAction func onEqualsPressed(sender: UIButton) {
        processOperation(currentOperation)
    }
   
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double (leftValString)! + Double(rightValString)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double (leftValString)! - Double(rightValString)!)"
                }
                
                CalkReadout.text = result
                leftValString = result
                rightValString = ""
            
                
                currentOperation = op
            } else {
              currentOperation = op
            }
            
            
        }else {
            //this is the first time an operator has been pressed
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = op
            
            
        }
    }
    
    func playSound() {
    
        btnSound.play()
    }
}
