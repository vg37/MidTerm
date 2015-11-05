//
//  DataViewController.swift
//  Midterm
//
//  Created by Gangisetty,Venugopal on 10/29/15.
//  Copyright © 2015 Gangisetty,Venugopal. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var listOfSubjects: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let subjects = self.listOfSubjects else {
            return
        }
        
        // update the user interface with CatNames
        self.dataLabel!.text = subjects
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}


