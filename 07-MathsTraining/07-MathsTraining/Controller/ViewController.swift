//
//  ViewController.swift
//  07-MathsTraining
//
//  Created by Macabuku on 6/1/19.
//  Copyright © 2019 Macabuku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var drawingView: DrawingImageView!
    
    let factory = QuestionFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberDrawn(_ image: UIImage) {
        
    }

}

