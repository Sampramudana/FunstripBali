//
//  BeritaKategoriTableViewCell.swift
//  FunstripBali
//
//  Created by Becak Holic on 11/25/17.
//  Copyright © 2017 Sam Pramudana. All rights reserved.
//

import UIKit

class BeritaKategoriTableViewCell: UITableViewCell {

    @IBOutlet weak var labelIsi: UILabel!
    @IBOutlet weak var labelKategori: UILabel!
    @IBOutlet weak var labelJudul: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
