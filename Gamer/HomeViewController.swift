//
//  ViewController.swift
//  Roshambo
//
//  Created by Rafael-Levy  on 4/12/19.
//  Copyright © 2019 udacity. All rights reserved.
//

import UIKit

enum RockPaperScissors: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
}

//when will it come?

class HomeViewController: UIViewController {
    var oponent: Int?
    var finalResult:String?
    
    // this is the first method which is called for this viewcontroller
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //intended code
    //command + A
    // control + i
    
    
    func comparision(myValue:Int, computerValue:Int) -> Bool{
        // 1 5
        switch myValue {
        case 1:
        // this the case when i choose rock ,computer value can be one of from 1,2,3
        //            1 2 -> false
            //            1 3 -> true

            if (computerValue == 2){
                return false
            }
            if (computerValue == 3 ){
                return true;
            }
            
            
        case 2 :
            // this the case when i choose paper
            //  2 1 -> true
            // 2 2 -> tie
            // 2 3 -> false
            if (computerValue == 1){
                return true
            }
            
            if (computerValue == 3){
                return false
            }
            
          
            
            
            
        case 3 :
            // this the case when i choose scissor
//            3 1 ->false
//            3 2 -> true
//            3 3 -> tie
            
            if (computerValue == 1){
                return false
            }
            if(computerValue == 2){
                return true
            }
            
        default:
            return true
        }
        
        return true;
    }
    
    
    
    @IBAction func rockButton() {
        
        // Get the ResultsViewController
        let result :String
        // what is the fixed number of rock?
        let rockNumber = RockPaperScissors.rock.rawValue
        
        let computerNumber = randonResults()
        
        // in case of tie.
        if (rockNumber == computerNumber){
            result = "TIE"
        }
        else {
            let win = comparision(myValue: rockNumber, computerValue: computerNumber)
            if win == true{
                result = "WON"
            }else{
                result = "LOST"
            }
        }
        
        // we will compare who will win.
        //in case of tie, we will not call this function.
        finalResult = result
        
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        controller.result = result
        self.navigationController?.pushViewController(controller, animated: true)
       // self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperButton() {
        
        let result :String
        // what is the fixed number of rock?
        let paperNumber = RockPaperScissors.paper.rawValue
        
        let computerNumber = randonResults()
        
        // in case of tie.
        if (paperNumber == computerNumber){
            result = "TIE"
        }
        else {
            let win = comparision(myValue: paperNumber, computerValue: computerNumber)
            if win == true{
                result = "WON"
            }else{
                result = "LOST"
            }
        }
        finalResult = result
        self.performSegue(withIdentifier: "paperSegue", sender: self)
    }
    
    
    @IBAction func scissorButton(_ sender: Any) {
        
        let result :String
        // what is the fixed number of rock?
        let scissorNumber = RockPaperScissors.scissors.rawValue
        
        let computerNumber = randonResults()
        
        // in case of tie.
        if (scissorNumber == computerNumber){
            result = "TIE"
        }
        else {
            let win = comparision(myValue: scissorNumber, computerValue: computerNumber)
            if win == true{
                result = "WON"
            }else{
                result = "LOST"
            }
        }
        finalResult = result
        self.performSegue(withIdentifier: "scissorsSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "paperSegue"{
           let vc = segue.destination as? ResultsViewController
            vc?.result = finalResult
        }
        else if segue.identifier == "scissorsSegue"{
            let vc = segue.destination as? ResultsViewController
            vc?.result = finalResult
        }
    }
    
    
    func randonResults() -> Int {
        // we have generated number
        let computerNumber = Int.random(in: 1..<4)  // between 1 and 3
        //    print("the computer number " , computerNumber)
        return computerNumber
    }
    
}

