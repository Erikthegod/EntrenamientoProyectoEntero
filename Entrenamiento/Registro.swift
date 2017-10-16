//
//  Registro.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit

class Registro : NSObject{
    
    var beber : String;
    var donde : String;
    var frecuencia : String;
    var horas : String;
    var lesion : String;
    var metodo : String;
    var objetivo : String;
    var trabajo : String;

    
    init(beber : String,
    donde : String,
    frecuencia : String,
    horas : String,
    lesion : String,
    metodo : String,
    objetivo : String,
    trabajo : String) {
        self.beber=beber
        self.donde=donde
        self.frecuencia=frecuencia
        self.horas=horas
        self.lesion=lesion
        self.metodo=metodo
        self.objetivo=objetivo
        self.trabajo=trabajo
    }
}
