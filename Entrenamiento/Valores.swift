//
//  Valores.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit

class Valores : NSObject{
    
    var repeticiones : Int;
    var rm : Int;
    var velocidad : Double;
    
    init(repeticiones : Int, rm : Int, velocidad : Double ) {
        self.repeticiones = repeticiones
        self.rm = rm
        self.velocidad = velocidad
    }
}
