//
//  SecondViewController.swift
//  03-coding
//
//  Created by Macabuku on 24/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var labelNumber: UILabel!
    
    @IBOutlet weak var TextViewResult: UITextView!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var labelGoldNum: UILabel!
    
    
    
    var fibonacci : [Int] = [0,1]
    var cantidadDeNumeros : [Int] = [0,1]
    var fusion = ["0", "1"]
    var fibId = 1
    var wantsGoldNum = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
                                                    // fibId = Int(self.stepper.value)
           updateLabel(id: Int(self.stepper.value)) //
                                                    // self.labelNumber.text = "\(self.fibId)"
        
        //self.TextViewResult.text = "\(self.fibonacci)"
        
        generateFibNumber()

    }

    func generateFibNumber(){
        
        
        
        if fibId == 1 {
            fibonacci = [0,1]
            cantidadDeNumeros = [0,1]
            fusion = ["Pos:\(cantidadDeNumeros[0])\t Valor: \(fibonacci[0])", "Pos:\(cantidadDeNumeros[1])\t Valor: \(fibonacci[1])"]

            
        } else {
            fibonacci = [0,1]
            cantidadDeNumeros = [0,1]
            fusion = ["Pos:\(cantidadDeNumeros[0])\t Valor: \(fibonacci[0])", "Pos:\(cantidadDeNumeros[1])\t Valor: \(fibonacci[1])"]
        // Generar numeros de Fibonacci hasta el fibId
        for i in 2...fibId {
            cantidadDeNumeros.append(i)
            fibonacci.append(fibonacci[i-1]+fibonacci[i-2])
            fusion.append("Pos:\(cantidadDeNumeros[i])\t Valor: \(fibonacci[i])")
            }
        }
        //let fibStr : [String] = fibonacci.compactMap { String($0)}
        let result : String = fusion.joined(separator: "\n")
        
        self.TextViewResult.text = result
        
    }
    
    
    
    
    @IBAction func steperPressed(_ sender: UIStepper) {
        
        updateLabel(id: Int(sender.value))
        
        generateFibNumber()
        
        // self.TextViewResult.text = "\(self.fibonacci)"
        
    }
    
    
    @IBAction func goldPressed (_ sender: UISwitch) {
      self.wantsGoldNum = sender.isOn
        calculateGoldNum()
        }

    
    
    func calculateGoldNum () {
            
        
        if (self.wantsGoldNum){
                if fibId == 1 {
                self.labelGoldNum.text = "No se puede calcular"
                
                    } else {
                        let last = Double(fibonacci[fibonacci.count-1])
                        let previous = Double(fibonacci[fibonacci.count-2])
                        let goldNum = last / previous
                        self.labelGoldNum.text = "\(goldNum)"
                        }
            } else {
                
                self.labelGoldNum.text = "Ver número de oro"
            
            }
         }
    
    
    
    func updateLabel(id: Int) {
        self.fibId = id
        self.labelNumber.text = "\(self.fibId)"
        generateFibNumber()
        calculateGoldNum()
    }
    
    
    
}

