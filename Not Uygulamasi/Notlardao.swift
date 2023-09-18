//
//  Notlardao.swift
//  Not Uygulamasi
//
//  Created by Kaan Deniz Erikmen on 18.09.2023.
//

import Foundation

class Notlardao{
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("notlar.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func TumNotlarıGoster() -> [Notlar]{
        var liste = [Notlar]()
        
        db!.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM notlar", values: nil)
            while rs.next(){
                let not = Notlar(not_id: Int(rs.string(forColumn: "not_id"))!,
                                 ders_adi: rs.string(forColumn: "ders_adi")!,
                                 vize: Int(rs.string(forColumn: "vize"))!,
                                 final: Int(rs.string(forColumn: "final"))!)
                liste.append(not)
            }
        } catch  {
            print(error.localizedDescription)
        }
        db!.close()
        return liste
    }
    
    func notEkle(ders_adi:String, vize:Int, final:Int){
        db!.open()
        do {
            try db!.executeUpdate("INSERT INTO notlar (ders_adi,vize,final) VALUES (?,?,?)", values: [ders_adi,vize,final])
                
            
        }catch  {
            print(error.localizedDescription)
        }
        db!.close()
    }
    func notGuncelle(not_id:Int, ders_adi:String, vize:Int, final:Int){
        db!.open()
        do {
            try db!.executeUpdate("UPDATE  notlar SET ders_adi = ? ,vize = ? ,final = ? WHERE  not_id", values: [ders_adi,vize,final,not_id])
                
            
        }catch  {
            print(error.localizedDescription)
        }
        db!.close()
    }
    func notSil(not_id:Int){
        db!.open()
        do {
            try db!.executeUpdate("DELETE FROM notlar WHERE not_id = ? ", values: [not_id])
                
            
        }catch  {
            print(error.localizedDescription)
        }
        db!.close()
    }

}

