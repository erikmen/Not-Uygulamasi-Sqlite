//
//  NotTableViewCell.swift
//  Not Uygulamasi
//
//  Created by Kaan Deniz Erikmen on 18.09.2023.
//

import UIKit

class NotTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDersAdi: UILabel!
    
    @IBOutlet weak var lblVize: UILabel!
    @IBOutlet weak var lblFinal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
