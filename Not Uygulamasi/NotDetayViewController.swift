//
//  NotDetayViewController.swift
//  Not Uygulamasi
//
//  Created by Kaan Deniz Erikmen on 18.09.2023.
//

import UIKit

class NotDetayViewController: UIViewController {

    @IBOutlet weak var txtFDersAdi: UITextField!
    @IBOutlet weak var txtFVize: UITextField!
    @IBOutlet weak var txtFFinal: UITextField!
    
    var not:Notlar?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let n = not {
            txtFDersAdi.text = n.ders_adi
            txtFVize.text = String(n.vize!)
            txtFFinal.text = String(n.final!)
            
        }
    }
    
    @IBAction func btnSil(_ sender: Any) {
        if let n = not{
            Notlardao().notSil(not_id: n.not_id!)
        }
    }
    
    @IBAction func btnGüncelle(_ sender: Any) {
        if let n = not, let ad = txtFDersAdi.text , let vize = txtFVize.text, let final = txtFFinal.text{
            if let v = Int(vize), let f = Int(final){
                Notlardao().notGuncelle(not_id: n.not_id!, ders_adi: ad, vize: v, final: f)
            }
        }
        
    }
    
}
