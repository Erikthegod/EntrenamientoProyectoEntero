//
//  Series.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Series : NSObject{
    
    var repeticiones : Int;
    var rmSerie : Int;
    
    
    init(repeticiones : Int, rmSerie : Int ) {
        self.repeticiones = repeticiones
        self.rmSerie = rmSerie
}
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String:Any] else { return nil }
        guard let repeticiones  = dict["repeticiones"] as? Int  else { return nil }
        guard let rmSerie = dict["rmSerie"]  as? Int else { return nil }
        self.repeticiones = repeticiones
        self.rmSerie = rmSerie
    }
}
