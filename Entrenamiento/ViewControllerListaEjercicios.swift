//
//  ViewControllerListaEjercicios.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 29/10/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage
import FirebaseStorageUI

class ViewControllerListaEjercicios: UITableViewController {
    var ejer : Ejercicios!
    var nombreEjercicio : String = ""
    var ejerciciosNom : [String] = []
    var ejercicios : [Ejercicios] = []
    var series : [Series] = []
    
    var numeroSeries : UInt = 0
    var dato : Datos!
    var datosRecogidos : [Datos] = [];
    
    var nombreRutina : String = "";
    
    var ref : DatabaseQuery!
    let preferences = UserDefaults.standard
    var nombreUsuario : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nombreUsuario = preferences.string(forKey: "usuario")
        self.ref = Database.database().reference().child("Personas").child(self.nombreUsuario).child("Rutinas").child(nombreRutina).queryOrderedByValue();
        /**
         * Recogemos Ejercicios con sus descansos y series
         */
        ref.observe(.childAdded, with: { (snapshot) -> Void in
            self.nombreEjercicio = snapshot.childSnapshot(forPath: "nombre").value as! String
            snapshot.childSnapshot(forPath: self.nombreEjercicio)
            self.numeroSeries = snapshot.childrenCount;
            self.numeroSeries -= 2; //Dos atributos que sobran del hijo en la BBDD
            for x in 0 ..< self.numeroSeries {
                let serie = Series(snapshot : snapshot.childSnapshot(forPath: String(x)))
                self.series.append(serie!);
            }
            let descanso = snapshot.childSnapshot(forPath: "descanso").value as! Int
            self.ejer = Ejercicios(nombreEjercicio: self.nombreEjercicio,series: self.series,descanso: descanso)!;
            self.ejercicios.append(self.ejer);
            self.series = []
            self.tableView.reloadData()
        })
        
        /* Al borrarse un usuario de la BBD
         ref.observe(.childRemoved, with: { (snapshot) -> Void in
         let index = self.indexOfMessage(snapshot)
         self.comments.remove(at: index)
         self.tableView.deleteRows(at: [IndexPath(row: index, section: self.kSectionComments)], with: UITableViewRowAnimation.automatic)
         })*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //    MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ejercicios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ejercicio = ejercicios[indexPath.row]
        let idCelda = "CeldaEjercicio"
        
        let celda = tableView.dequeueReusableCell(withIdentifier: idCelda, for: indexPath) as! CeldaEjercicio
        celda.nombreEjercicio.text = ejercicio.nombre
        celda.descanso.text = "Descanso: \(String(describing: ejercicio.descanso!))"
        celda.series.text = "Series: \(String(describing: ejercicio.seriesEjercicios!.count))"
        
        return celda
    }
}

