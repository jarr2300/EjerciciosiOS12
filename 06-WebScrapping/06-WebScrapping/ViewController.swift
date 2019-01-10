//
//  ViewController.swift
//  06-WebScrapping
//
//  Created by Macabuku on 5/1/19.
//  Copyright © 2019 Macabuku. All rights reserved.
//

import UIKit
import Alamofire
import Kanna


class ViewController: UIViewController {
    
    let urlName = "https://www.apple.com/itunes/charts/songs/"
    // let urlName = "https://www.apple.com/itunes/charts/songs/"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrapeURL()
    }

    func scrapeURL(){
        Alamofire.request(urlName).responseString {response in
            if response.result.isSuccess {
                if let htmlString = response.result.value {
                    self.parseHTML(html: htmlString)
                }
                
            }
        }
        
    }
    func parseHTML(html: String){
        // print(html)
        
        do {
            let doc = try Kanna.HTML(html: html, encoding: String.Encoding.utf8)
            //print(doc.title)
            var a = ""
            for div in doc.css("div"){
                if div["class"] == "section-content"{
                     for ul in div.css("ul"){
                        for li in ul.css("li"){
                            a = li.text!
                            print(a.prefix(a.count-17))
                            
                        }
                     }
                }
            }
            

        }catch{
            print(error)
        }
    }

}

