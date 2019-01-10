//
//  IMCViewController.swift
//  03-coding
//
//  Created by Macabuku on 28/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import UIKit

class IMCViewController: UIViewController {

    
    @IBOutlet weak var edadLabel: UILabel!
    
    @IBOutlet weak var pesoLabel: UILabel!
    
    @IBOutlet weak var alturaLabel: UILabel!
    
    @IBOutlet weak var labelResults: UILabel!
    
    
    var edad = 45
    var pesoKg = 10
    var alturaCm : Int = 50
    var resultadoIMC : Double = 0.0
    var alturaM : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        edadLabel.text = "\(edad)"
        pesoLabel.text = "\(pesoKg)"
        alturaLabel.text = "\(alturaCm)"
        alturaM = Double((Double(alturaCm)/100.0))
    }
    
    
    /// Calculo de Indice de masa corporal IMC = peso (kg)/estatura^2 (m)
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func edadSlider(_ sender: UISlider) {
        edadLabel.text = "\(Int(sender.value))"
        edad = Int(sender.value)
        calcularIMC()
    }
    /////
    
    
    
    @IBAction func pesoSlider(_ sender: UISlider) {
        pesoLabel.text = "\(Int(sender.value))"
        pesoKg = Int(sender.value)
        calcularIMC()
    }
    
    
    @IBAction func alturaSlider(_ sender: UISlider) {
        alturaLabel.text = "\(Int(sender.value))"
        alturaM = Double((sender.value)/100)
        calcularIMC()
    }
    
    @IBAction func calculoIMC(_ sender: UIButton) {
        calcularIMC()
        showResults ()
    }
    
    func calcularIMC(){
        
        self.resultadoIMC = Double(pesoKg) / (pow(self.alturaM,2.0))
        //self.resultadoIMC = Double(pesoKg) / ((self.alturaM)*(self.alturaM))
        print(self.pesoKg)
        print(self.alturaM)
        print(self.resultadoIMC)
        showResults ()
    
    }
    
    func showResults () {
        let tabla : Double = self.resultadoIMC
        switch tabla {
            case 0..<18.5:
                labelResults.textColor = UIColor(red: 85.0/255.0, green: 200.0/255.0, blue: 2000.0/255.0, alpha: 1)
                labelResults.text = ("Su indice de masa corporal es: \(NSString(format: "%.2f", self.resultadoIMC)) \n" + "Peso inferior al normal")
        case 18.5..<25:
            labelResults.textColor = UIColor(red: 0.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 1)
            labelResults.text = ("Su indice de masa corporal es: \(NSString(format: "%.2f", self.resultadoIMC)) \n" + "Peso normal")
        case 25..<30:
            labelResults.textColor = UIColor(red: 190.0/255.0, green: 125.0/255.0, blue: 150.0/255.0, alpha: 1)
            labelResults.text = ("Su indice de masa corporal es: \(NSString(format: "%.2f", self.resultadoIMC)) \r" + " Peso superior al normal")
        default:
            labelResults.textColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1)
            labelResults.text = ("Su indice de masa corporal es: \(NSString(format: "%.2f", self.resultadoIMC)) \r" + " Obesidad")
        }
        
        
    }
    
    
}


