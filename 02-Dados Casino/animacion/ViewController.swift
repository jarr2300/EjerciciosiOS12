//
//  ViewController.swift
//  dados
//
//  Created by Mac Mini on 22/12/18.
//  Copyright © 2018 Mac Mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dadoDinamico: UIImageView!
    
    @IBOutlet weak var dadoDinamico2: UIImageView!
    
    @IBOutlet weak var resultado: UILabel!
    
    var randomDiceIndexLeft : Int = 0
    var randomDiceIndexRight: Int = 0
    //var diceImages: [UIImage] = []
    var diceImages: [UIImage] = [#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2.png"),#imageLiteral(resourceName: "dice3.png"),#imageLiteral(resourceName: "dice4.png"),#imageLiteral(resourceName: "dice5.png"),#imageLiteral(resourceName: "dice6.png")] // Array de las imágenes de la animación (SHIF + COMAND + M)
    var numeroDeImagenes : Int
    var n = 0
    //var contadorIzquierdo : [Int] = [0,0,0,0,0,0]
    //var contadorDerecho : [Int] = [0,0,0,0,0,0]
    
    
    required init?(coder aDecoder: NSCoder) {
        numeroDeImagenes = diceImages.count // Hay que inicializar el valor del número de elementos del Arrayde imagenes
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //generateRandomDices() // genera que los dados no empiecen siempre con el mismo valor
    }
    
        
        
     // Animación del Array del Objeto ( el dado ) y Array de imagenes ( en este caso diceImages)
     func animate(imageView: UIImageView, images: [UIImage]) {
     
        
        //Parte encargada de ir cambiando las imagenes del dado
        imageView.animationImages = images
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 2
        imageView.startAnimating()
        
        //Parte encargada del movimiento en la pantalla de los dados
        UIView.animate(withDuration: 1.2,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.dadoDinamico.transform = CGAffineTransform(scaleX: 0.5, y: 0.5 ).concatenating(CGAffineTransform(rotationAngle: 360)).concatenating(CGAffineTransform(translationX: -25, y: 20))
        })
        
        UIView.animate(withDuration: 1.2,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.dadoDinamico2.transform = CGAffineTransform(scaleX: 0.5, y: 0.5).concatenating(CGAffineTransform(rotationAngle: -360)).concatenating(CGAffineTransform(translationX: 25, y: 20))
        })
        
     }
    /*
    func conteoIzquierdo (izq: Int) {
        let local = izq
        switch local {
        
        case 1:
            
            contadorIzquierdo[0] += 1
        case 2:
            contadorIzquierdo[1] += 1
        case 3:
            contadorIzquierdo[2] += 1
        case 4:
            contadorIzquierdo[3] += 1
        case 5:
            contadorIzquierdo[4] += 1
        default :
            contadorIzquierdo[5] += 1
        }
    }
    
    func conteoDerecho (der: Int) {
        let local = der
        switch local {
            
        case 1:
            //self.n = n + 1
            contadorDerecho[0] += 1
        case 2:
            contadorDerecho[1] += 1
        case 3:
            contadorDerecho[2] += 1
        case 4:
            contadorDerecho[3] += 1
        case 5:
            contadorDerecho[4] += 1
        default :
            contadorDerecho[5] += 1
        }
    }
    */
    
    @IBAction func diceShake(_ sender: UIButton) {
        

        generateRandomDices()
        //conteoIzquierdo (izq: (randomDiceIndexLeft+1))
        //conteoDerecho (der: (randomDiceIndexRight+1))
        //print("\(contadorIzquierdo)")
        //print("\(contadorDerecho)")
        self.dadoDinamico.transform = CGAffineTransform.identity
        self.dadoDinamico2.transform = CGAffineTransform.identity
    }
    
     
     func generateRandomDices(){
        randomDiceIndexLeft =  Int.random(in: 0..<numeroDeImagenes)  // genera un número aleatorio para cada dado
        randomDiceIndexRight = Int.random(in: 0..<numeroDeImagenes) //
        
        n = randomDiceIndexLeft+randomDiceIndexRight+2 // se suma dos porque los indices empiezan en 0
        animate(imageView: dadoDinamico, images: diceImages)
        animate(imageView: dadoDinamico2, images: diceImages)
        
        
        //dadoDinamico.image = UIImage ( named: "dice\(randomDiceIndexLeft)")
        //dadoDinamico2.image = UIImage ( named: "dice\(randomDiceIndexRight)")
        //print("Izquierdo : \(randomDiceIndexLeft+1)")
        //print("Derecho : \(randomDiceIndexRight+1)")
        
        self.dadoDinamico.transform = CGAffineTransform.identity
        self.dadoDinamico2.transform = CGAffineTransform.identity
        
        dadoDinamico.image = diceImages[randomDiceIndexLeft]    // Muestra la imagen del Array
        dadoDinamico2.image = diceImages[randomDiceIndexRight]  // en la posición obtenida
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1 ) {
        self.resultado.text = "\(self.n)"
        }
        
    }
    
    
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generateRandomDices()
        }
    }
    
    
}

