//
//  ViewController.swift
//  Not Uygulamasi
//
//  Created by Kaan Deniz Erikmen on 18.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var notTableView: UITableView!
    
    var notlarListe = [Notlar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        
        notTableView.delegate = self
        notTableView.dataSource = self
        
                
    }
    override func viewWillAppear(_ animated: Bool) {
        notlarListe = Notlardao().TumNotlarıGoster()
        
        var toplam = 0
        
        for n in notlarListe {
            toplam = toplam + (n.vize! + n.final!)/2
            
        }
        if notlarListe.count != 0{
            navigationItem.prompt = "Ortalama : \(toplam / notlarListe.count)"
        }else{
            navigationItem.prompt = "Ortalama :  Yok"
        }
        notTableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        if segue.identifier == "toDetay"{
            let gidilecekVC = segue.destination as! NotDetayViewController
            
            gidilecekVC.not = notlarListe[indeks!]
        }
    }
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "notlar", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("notlar.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten Var")
        }else{
            do {
                try  fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch  {
                print(error)
            }
        }
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlarListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "notUygulamasi", for: indexPath) as! NotTableViewCell
        cell.lblDersAdi.text = not.ders_adi
        cell.lblVize.text = String(not.vize!)
        cell.lblFinal.text = String(not.final!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
}
