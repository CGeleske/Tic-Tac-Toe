//
//  ViewController.swift
//  Sassy Tic-tac-toe
//
//  Created by Christopher Geleske on 7/2/15.
//  Copyright © 2015 Christopher Geleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    
    @IBOutlet weak var sassDisplayLabel: UILabel!
    
    var labelsArray:[GridLabel]!
    var xTurn = true
    var isGood = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsArray = [gridLabel0, gridLabel1, gridLabel2, gridLabel3, gridLabel4, gridLabel5, gridLabel6, gridLabel7, gridLabel8]
    }
    
    func checkCombo(a: Int, b: Int, c: Int) {
        if labelsArray[a].text != "" && (labelsArray[a].text == labelsArray[b].text) && (labelsArray[b].text == labelsArray[c].text){
            isGood = true
            displayWinningAlert()
        }
        else {
            isGood = false
        }
    }
    
    func checkForWinner() {
        checkCombo(0, b: 3, c: 6)
        checkCombo(1, b: 4, c: 7)
        checkCombo(2, b: 5, c: 8)
        checkCombo(0, b: 1, c: 2)
        checkCombo(3, b: 4, c: 5)
        checkCombo(6, b: 7, c: 8)
        checkCombo(0, b: 4, c: 8)
        checkCombo(2, b: 4, c: 6)
    }
    
    
    func displayWinningAlert() {
            let message = "Congratultions! "
            let alert = UIAlertController(title: "You won, wow, great for you. Now go outside.", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            resetBoard()
    }
    
    @IBAction func screenWasTapped(sender: UITapGestureRecognizer) {
        print("Grid was tapped")
        var emptyLabel = false
        for GridLabel in labelsArray {
            if GridLabel.canTap {
                if (CGRectContainsPoint(GridLabel.frame, sender.locationInView(backgroundView))) {
                    print("woot")
                    if xTurn {
                        GridLabel.text = "X"
                    }
                    else {
                        GridLabel.text = "O"
                    }
                    xTurn = !xTurn
                    GridLabel.canTap = false
                    checkForWinner ()
                }
                
            }
            if GridLabel.text == "" {
                emptyLabel = true
            }
        }
        if !emptyLabel {
            let message = "Congratultions! "
            let alert = UIAlertController(title: "You both lost", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            resetBoard()

        }
    }
    
    func resetBoard() {
        for GridLabel in labelsArray {
            GridLabel.text = ""
            GridLabel.canTap = true
        }
    }
}






