//
//  ViewControllerRutinas.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/10/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage
import FirebaseStorageUI

class ViewControllerRutinas: UITableViewController {
    
    var rutinas : [Rutina] = []
    var ref: DatabaseReference!

    let preferences = UserDefaults.standard
    var nombreUsuario : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nombreUsuario = preferences.string(forKey: "usuario")
        self.ref = Database.database().reference().child("Personas").child(nombreUsuario).child("Rutinas")
        /**
         * Recogemos nombres de las rutinas de la persona
         */
        ref.observe(.childAdded, with: { (snapshot) -> Void in
            if let rutina = Rutina(rutinaJson: snapshot.key) {
                if !self.rutinas.contains(rutina){
                    self.rutinas.append(rutina)
                    self.tableView.reloadData()
                }
            } else {
                print("No dispone de rutinas")
            }
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
        return self.rutinas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rutina = rutinas[indexPath.row]
        let idCelda = "CeldaRutinas"
        
        let celda = tableView.dequeueReusableCell(withIdentifier: idCelda, for: indexPath)
        celda.textLabel?.text = rutina.nombre
        
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueListaEjericios"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let rutinaElegida = self.rutinas[indexPath.row]
                let viewDestino = segue.destination as! ViewControllerListaEjercicios
                viewDestino.nombreRutina = rutinaElegida.nombre
            }
        }
    }
}
