//
//  FontDetailViewController.swift
//  03-coding
//
//  Created by Macabuku on 26/12/18.
//  Copyright © 2018 Macabuku. All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    

    var familiName : String = ""
    
    var fonts : [String] = []
    
    
    
    //var conversion = Int("14")
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var pickerFonts: UIPickerView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var sizeText: UILabel!
    
    @IBOutlet weak var stepperVal: UIStepper!
    
    
    var size = 0
    
    var sizeFontData : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel(id: Int(self.stepperVal.value))
       
        // Do any additional setup after loading the view.
        self.labelTitle.text = familiName
        self.labelTitle.font = UIFont(name: familiName, size: CGFloat(size))
        
        if fonts.count == 0 {
            self.pickerFonts.isHidden = true
        }
       
        self.textView.font = UIFont(name: familiName, size: CGFloat(size))
       // self.textView.font = UIFont(name: fonts[0], size: CGFloat(size))
        
        
        
        // sizeText.text = ""
        size = Int(self.stepperVal.value)
        self.pickerFonts.dataSource = self
        self.pickerFonts.delegate = self
        
        // destinationVC.familiName = self.families[idx]
        // destinationVC.fonts = self.fonts[self.families[idx]]!
        //self.textView.font = UIFont(name: familiName, size: CGFloat(sizeText))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //  @IBAction func doneButtonPress(_ sender: UIBarButtonItem) {
    //self.dismiss(animated: true, completion: nil )
    // }
    
    
    @IBAction func doneButtonPress(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        
    }
    
    
    @IBAction func cambiaTexto(_ sender: UIStepper) {
        updateLabel(id: Int(sender.value))
        viewDidLoad()
    }
    
    func updateLabel(id: Int) {
        size = id
        self.sizeText.text = "\(size)"
        
    }
    
    
    //MARK: - UIPickerView Data Source Methods
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    //MARK: UIpickerView Delegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = fonts[row]
        self.textView.font = UIFont(name: font, size: CGFloat(size))
        
    }
    
    
   
    
    
    
}
