//
//  Personas.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import Foundation
import UIKit

class Personas : NSObject{
    
    var nombre:String;
    var pass:String;
    var usuario:String;
    var numero:Int;
    var correo:String;
    var perfil:Perfil;
    var registro:Registro;
    var rutinas: Rutina;
    var datos:Datos;
    var nombreEntrenador:String;
    var foto:String;
    var fotoPerfil:UIImage;
    
    init( nombre:String,pass:String, usuario:String,numero:Int,correo:String,perfil:Perfil,registro:Registro,rutinas: Rutina,datos:Datos,nombreEntrenador:String,foto:String,fotoPerfil:UIImage) {
        self.nombre = nombre
        self.pass = pass
        self.usuario = usuario
        self.numero = numero
        self.correo = correo
        self.perfil = perfil
        self.registro = registro
        self.rutinas = rutinas
        self.datos = datos
        self.nombreEntrenador = nombreEntrenador
        self.foto=foto
        self.fotoPerfil = fotoPerfil
    }
}
