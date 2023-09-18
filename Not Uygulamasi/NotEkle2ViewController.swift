//
//  NotEkle2ViewController.swift
//  Not Uygulamasi
//
//  Created by Kaan Deniz Erikmen on 18.09.2023.
//

import UIKit

class NotEkle2ViewController: UIViewController {
    @IBOutlet weak var Ders_adi: UITextField!
    
    @IBOutlet weak var Vize: UITextField!
    @IBOutlet weak var Final: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
   
    @IBAction func ekledersi(_ sender: Any) {
        if let ad = Ders_adi.text , let vize = Vize.text, let final = Final.text{
            if let v = Int(vize), let f = Int(final){
                Notlardao().notEkle(ders_adi: ad, vize: v, final: f)
            }
        }
        Ders_adi.text = ""
        Vize.text = ""
        Final.text = ""
    }
    
   

}
