//
//  ViewController.swift
//  soypobre
//
//  Created by Mac Mini on 22/12/18.
//  Copyright © 2018 Mac Mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var etiquetaEstado: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var botonEstado: UIButton!
    
    @IBOutlet weak var fondoBasura: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var eleccion = true
    
    @IBAction func botonPulsado(_ sender: UIButton) {
        
        
        if eleccion == true {
        self.etiquetaEstado.text = "Soy Rico"
        self.etiquetaEstado.textColor = .green
        self.imagen.image = UIImage ( named: "soyrico")
        self.fondoBasura?.isHidden = true
        eleccion = false
        //botonEstado.setImage(UIImage(named: "soyrico"), for: .normal)
        } else {
            
            self.etiquetaEstado.text = "Soy pobre"
            self.etiquetaEstado.textColor = .black
            self.imagen.image = UIImage ( named: "soypobre")
            self.fondoBasura?.isHidden = false
            eleccion = true
        }
    }
    
    
    
    
}

