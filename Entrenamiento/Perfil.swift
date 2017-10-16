//
//  Perfil.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit

class Perfil : NSObject{

    var peso : Double;
    var grasa : Double;
    var masa: Double;
    var pectoral: Double;
    var brazo: Double;
    var cintura: Double;
    var abdomen: Double;
    var cadera: Double;
    var muslo: Double;
    var pantorrilla: Double;
    var fecha : String;
    
    init( peso : Double,
    grasa : Double,
    masa: Double,
    pectoral: Double,brazo: Double,
    cintura: Double,
    abdomen: Double,
    cadera: Double,
    muslo: Double,
    pantorrilla: Double,
    fecha : String) {
        self.peso=peso
        self.grasa=grasa
        self.masa=masa
        self.pectoral=pectoral
        self.brazo=brazo
        self.cintura=cintura
        self.abdomen=abdomen
        self.cadera=cadera
        self.muslo=muslo
        self.pantorrilla=pantorrilla
        self.fecha=fecha
    }
}
