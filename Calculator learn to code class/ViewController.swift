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
    
    var runningNumber: String = "0"
    var leftValString = "0"
    var rightValString = "0"
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
        if runningNumber == "0" {
            runningNumber = ""
        }
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
    
    @IBAction func onClearPressed(sender: UIButton) {
        playSound()
        if runningNumber != "0" {
            clearRunningNumber()
        } else {
            clearAll()
        }
    }
   
    
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            if runningNumber != "" && runningNumber != "0" {
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
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = op
            
            
        }
    }
    
    func playSound() {
        if btnSound.playing{
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func clearRunningNumber() {
        resetRunningNumber()
        resetReadout()
        currentOperation = Operation.Empty
    }
    
    func clearAll() {
        leftValString = "0"
        rightValString = "0"
        currentOperation = Operation.Empty
        resetReadout()
    }
   
    func resetRunningNumber() {
        runningNumber = "0"
    }
    
    func resetReadout() {
        CalkReadout.text = "0"
    }
}
