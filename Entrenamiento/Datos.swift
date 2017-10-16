//
//  Datos.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//  Clase que representa los datos de cada levantamiento que realiza cada usuario
//

import Foundation
import UIKit

class Datos : NSObject{
    
    var nombreEjercicio : String! ;
    var nombrePersona : String! ;
    var peso : Double!;
    var velocidad : Double!;
    var fecha : String!;
    var repeticiones : Int!;

    
    init(nombreEjercicio : String, nombrePersona : String, peso : Double, velocidad : Double, fecha : String, repeticiones : Int) {
        self.nombrePersona = nombrePersona
        self.nombreEjercicio = nombreEjercicio
        self.peso = peso
        self.velocidad = velocidad
        self.fecha = fecha
        self.repeticiones = repeticiones
    }
    
    
}

