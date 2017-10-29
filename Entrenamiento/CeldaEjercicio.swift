//
//  CeldaEjercicio.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 29/10/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import UIKit

class CeldaEjercicio: UITableViewCell {
    

    @IBOutlet var nombreEjercicio: UILabel!
    @IBOutlet var series: UILabel!
    @IBOutlet var descanso: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
