//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Rafael-Levy  on 4/12/19.
//  Copyright © 2019 udacity. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var result:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultLabel.text = result
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
