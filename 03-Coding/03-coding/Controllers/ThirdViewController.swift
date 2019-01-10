//
//  ThirdViewController.swift
//  03-coding
//
//  Created by Macabuku on 24/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var families : [String] = []
    
    var fonts : [String: [String]] = [:]
    
    var ordenar : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        families = UIFont.familyNames.sorted(by: { return $0 < $1 })
        
        for fam in families{
            
            // fonts[fam] = UIFont.fontNames(forFamilyName: fam)  // con esta linea no se ordenarían las fuentas de cada familia
            
             ordenar = UIFont.fontNames(forFamilyName: fam)         // guarda el array de las fonts en una variable para ordenar
            
            /*
            if ordenar.last == nil { // Busca la familia SIN FUENTES
                
                print("\(fam)")
                print("REMOVE : \(fam)")
                families = families.filter{$0 != fam}   // Recorre el ARRAY families ( $0 ) dejando intacto lo que sea distinto de fam en este caso
                                                        // Resumiendo --> Borra lo que sea igual a fam ( en esa igualdad )
                
                print("\(fam)")
                
            }
            */
            // print("fonts[fam] : \(fonts[fam])")
            
             fonts[fam] = ordenar.sorted(by: { return $0 < $1 })    //guarda el Array de fuentes ya ordenado en su familia
            //n += 1
            
        }
       
        
        // Do any additional setup after loading the view.
    }
    

    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "ShowFontsForFamily" {
            
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontDetailViewController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.familiName = self.families[idx]
            destinationVC.fonts = self.fonts[self.families[idx]]!
        }
    }
    

// MARK: - Métodos del protocolo UITableDataSource
    
    // configura una seccion en la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Le decimos cuantas filas queremos que muestre en pantalla ( en TOTAL )
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.families.count // Todas las que hemos obtenido
    
    }

    // Configura los elementos de cada fila
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        let fontFamily =  families[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        return cell
    }

    //MARK: Métodos del protocolo UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = families[row]
        let familyFonts = fonts[fontFamily]!
        print(familyFonts)
        
    }
    
    
    
}
