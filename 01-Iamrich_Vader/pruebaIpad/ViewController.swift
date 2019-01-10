//
//  ViewController.swift
//  pruebaIpad
//
//  Created by Mac Mini on 20/12/18.
//  Copyright © 2018 Mac Mini. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
// Propertys
    @IBOutlet weak var etiquetaSoyRico: UILabel!
    
    @IBOutlet weak var botonDescubrelo: UIButton!
    
    @IBOutlet weak var etiquetaMensajes: UILabel!
    
    @IBOutlet weak var imagenVader: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

 //METHODS
    
    
    var onoff = false  // activa el backup de las etiquetas de la label y el boton en la primera ejecucuón
    var backupTitulo = ""
    var backupBoton = ""
    var primerIntento = true
    
    @IBAction func botonDescubreloPulsado(_ sender: UIButton) {
        
        let titulo = self.etiquetaSoyRico.text!
        // let boton = self.botonDescubrelo.currentTitle!
        
        if onoff == false && primerIntento == true {
            backupTitulo = titulo
           // backupBoton = boton
        }
        
        
        if onoff == false && primerIntento == true {
        self.etiquetaSoyRico.text = "Ven al lado oscuro"
        //self.imagenVader.image = UIImage (named: "Vader")
        botonDescubrelo.setImage(UIImage(named: "Vader.png"), for: .normal)
        //botonDescubrelo.setImage(UIImage(named: "Vader.png"), for: .normal)
        //self.etiquetaMensajes.text = "Púlsame para continuar"
        primerIntento = false
        } else if onoff == false && primerIntento == false {
        botonDescubrelo.image(for: .selected)
        let controller = UIAlertController (title: "Bienvenido", message: """
Tienes que decidir
si quieres formar
parte del ejercito
del Imperio Galáctico
""", preferredStyle: .alert   )
            
            
            
            
            // let  action = UIAlertAction (title: "OK", style: .default, handler: nil)
            let action = UIAlertAction (title: "Aceptar", style: .default) { (action) in
                self.etiquetaMensajes.text = "Enhorabuena,\n bienvenido al lado oscuro"
                //self.botonDescubrelo.setTitle("Enhorabuena,\n pulsa y ven lado oscuro", for: UIControl.State.normal)
                self.onoff = true
                
            }
            
            controller.addAction(action)
            
            let  action2 = UIAlertAction (title: "No", style: .destructive , handler: { (action2) in
                
                self.etiquetaMensajes.text = "Morirás escoria rebelde"
                //self.botonDescubrelo.setTitle("Pulsa aquí maldito rebelde", for: UIControl.State.normal)
                self.onoff = true
            })
            
            controller.addAction(action2)
            
            let  action3 = UIAlertAction (title: "Me lo pienso", style: .cancel) { (action3) in
                self.etiquetaMensajes.text = "Eres peor que\n la escoria rebelde,\neres una rata cobarde"
                //self.botonDescubrelo.setTitle("Pulsa aquí rata cobarde", for: UIControl.State.normal)
                self.onoff = true
            }
            
            controller.addAction(action3)
            
            self.show(controller, sender: nil)
        
        }
        
        if onoff == true {
            self.etiquetaSoyRico.text = (backupTitulo)
            botonDescubrelo.setImage(UIImage(named: "ruby-image.png"), for: .normal)
            self.etiquetaMensajes.text = ("\(backupBoton)")
            onoff = false
            primerIntento = true
            
        }
            
    }
    
}

