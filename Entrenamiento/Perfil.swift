//
//  Perfil.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Perfil : NSObject{

    var peso : Double?;
    var grasa : Double?;
    var masa: Double?;
    var pectoral: Double?;
    var brazo: Double?;
    var cintura: Double?;
    var abdomen: Double?;
    var cadera: Double?;
    var muslo: Double?;
    var pantorrilla: Double?;
    var fecha : String?;
    
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
    
    init?(perfilJson : DataSnapshot){
        guard let json = perfilJson.value as? [String:Any] else { return nil }
        let peso = json["peso"] as? Double
        let grasa = json["grasa"] as? Double
        let masa = json["masa"] as? Double
        let pectoral = json["pectoral"] as? Double
        let brazo = json["brazo"] as? Double
        let cintura = json["cintura"] as? Double
        let abdomen = json["abdomen"] as? Double
        let cadera = json["cadera"] as? Double
        let muslo = json["muslo"] as? Double
        let pantorrilla = json["pantorrilla"] as? Double
        let fecha = json["fecha"] as? String
        
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
