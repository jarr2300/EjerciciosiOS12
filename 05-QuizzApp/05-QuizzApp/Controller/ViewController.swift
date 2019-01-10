//
//  ViewController.swift
//  05-QuizzApp
//
//  Created by Macabuku on 30/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var labelQuestionNumber: UILabel!
    
    @IBOutlet weak var labelScore: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
    }


    
    @IBAction func buttonPress(_ sender: UIButton) {
        
        let factory = QuestionsFactory()
        let question = factory.generateRandomQuestion()
        print(question)
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}

