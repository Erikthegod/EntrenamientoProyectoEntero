//
//  Ejercicios.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit

class Ejercicios : NSObject{
    
    var nombre : String!;
    var seriesEjercicios : [Series]?;
    var valores : [Valores]?;
    var grupo : String?;
    var descanso : Int?;
    var imagen : UIImage?;


    init(nombre : String, seriesEjercicios : [Series], valores : [Valores], grupo : String, descanso : Int, imagen : UIImage ) {
        self.nombre = nombre
        self.seriesEjercicios = seriesEjercicios
        self.valores = valores
        self.grupo = grupo
        self.descanso = descanso
        self.imagen = imagen
    }
    
    init?(nombreEjercicio : String, series :[Series], descanso:Int){
        self.nombre = nombreEjercicio
        self.seriesEjercicios = series
        self.descanso = descanso
    }
}

