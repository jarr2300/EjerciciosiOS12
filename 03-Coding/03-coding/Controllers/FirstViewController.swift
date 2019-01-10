//
//  FirstViewController.swift
//  03-coding
//
//  Created by Macabuku on 24/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var labelAge: UILabel!
    
    @IBOutlet weak var sliderAge: UISlider!
    
    
    var userAge = 18
    var userName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                           ///
        updateAgeLabel() // userAge = Int(self.sliderAge.value)
                        // self.labelAge.text = "\(userAge)"
                        ///
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Cerramos el teclado
        textField.resignFirstResponder()
        
        print("Hemos pulsado enter")
        
        if let theText = textField.text {
            print(theText)
            self.userName = theText
        }
        
        //Indicamos la finalización de la edición del textField
        return true
    }
    

    @IBAction func sliderAgeMove(_ sender: UISlider) {
        updateAgeLabel()
        
    }
    
    func updateAgeLabel () {
        
        userAge = Int(self.sliderAge.value)
        self.labelAge.text = "\(userAge)"
        
    }
    
    @IBAction func validateData(_ sender: UIButton) {
        if userName == "Juan Gabriel" {
            
            print("Puedes pasar")
            self.view.backgroundColor = UIColor(red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        } else {
            if userAge >= 18 {
             print("Puedes pasar a la fiesta pagando" )
             self.view.backgroundColor = UIColor(red: 58.0/255.0, green: 164.0/255.0, blue: 250.0/255.0, alpha: 0.8)
            } else {
                print("No puedes pasar por ser menor de edad")
                self.view.backgroundColor = UIColor(red: 212.0/255.0, green: 61.0/255.0, blue: 7.0/255.0, alpha: 0.9)
            }
        }
        
        
    }
    
    
}

