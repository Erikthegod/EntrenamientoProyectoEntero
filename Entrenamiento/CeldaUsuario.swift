//
//  CeldaUsuario.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 21/10/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import UIKit

class CeldaUsuario: UITableViewCell {

    @IBOutlet var fotoUsuario: UIImageView!
    @IBOutlet var nombre: UILabel!
    @IBOutlet var numero: UILabel!
    @IBOutlet var correo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
