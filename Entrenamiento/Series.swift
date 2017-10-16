//
//  Series.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit

class Series : NSObject{
    
    var repeticiones : Int;
    var rmSerie : Int;
    
    
    init(repeticiones : Int, rmSerie : Int ) {
        self.repeticiones = repeticiones
        self.rmSerie = rmSerie
}
}
