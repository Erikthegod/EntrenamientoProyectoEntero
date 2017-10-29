//
//  Rutina.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class Rutina : NSObject{
    
    var nombre : String;
    
    init(nombre : String) {
        self.nombre = nombre
    }
    
    init?(rutinaJson: String){
        let rutina  = rutinaJson
        self.nombre = rutina
    }

}

