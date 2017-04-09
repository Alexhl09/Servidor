//
//  ViewController.swift
//  Open Library
//
//  Created by Alejandro on 09/04/17.
//  Copyright © 2017 Alejandro. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var code: UITextField!
   
    @IBOutlet weak var resultado: UILabel!
    
        func sincrono() {
            let code = self.code.text!
            let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(code)"
            let url = NSURL(string: urls)
            let datos:NSData? = NSData(contentsOf: url! as URL)
            
            if (datos != nil) {
                let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
                print(texto!)
                resultado.text = texto as String!
            } else {
                resultado.text = "No hay conexión a Internet"
            }
        }
        

    
    override func viewDidLoad() {
        sincrono()
        code.delegate = self

       
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
    }
    
    @IBAction func textFieldDoneEditing(sender : UITextField)
    {
        sender.resignFirstResponder()
        sincrono()
    }

    @IBAction func backgroundTap(sender: UIControl){
        code.resignFirstResponder()
        resultado.resignFirstResponder()}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

