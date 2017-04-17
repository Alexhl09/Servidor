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
   
    @IBOutlet weak var portada: UILabel!
    @IBOutlet weak var autor: UILabel!
    @IBOutlet weak var name: UILabel!

    
        func sincrono() {
            let code = self.code.text!
            let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(code)"
            let url = NSURL(string: urls)
            let datos:NSData? = NSData(contentsOf: url! as URL)
            
            if (datos != nil) {
                let texto = NSString(data: datos! as Data, encoding: String.Encoding.utf8.rawValue)
                print(texto!)
                portada.text = texto as String!
            } else {
                portada.text = "No hay conexión a Internet"
            }
        
    do {
    let json = try JSONSerialization.jsonObject(with: datos! as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
    let dico1 = json as! NSDictionary
    let dico2 = dico1["ISBN:\(code)"] as! NSDictionary
    self.name.text = dico2["title"] as! NSString as String
    let dico3 = dico2["authors"] as! NSDictionary
    self.autor.text = dico3["name"] as! NSString as String
    self.portada.text = "http://covers.openlibrary.org/b/isbn/\(code)-L.jpg"
    
    }
    catch _ {
    
    }
    }
    
    override func viewDidLoad() {
       
        code.delegate = self

       
                super.viewDidLoad()
        
       
        // Do any additional setup after loading the view, typically from a nib.
     self.code.delegate = self;
    
    }
    
    @IBAction func textFieldDoneEditing(sender : UITextField)
    {
        sender.resignFirstResponder()
    
    }

    @IBAction func backgroundTap(sender: UIControl){
        code.resignFirstResponder()
        portada.resignFirstResponder()}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    

}

