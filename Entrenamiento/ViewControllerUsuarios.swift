//
//  ViewControllerUsuarios.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import SDWebImage
import FirebaseStorageUI

class ViewControllerUsuarios: UITableViewController {

    //    private StorageReference mStorageRef;

    var personas : [Personas] = []
    var ref: DatabaseReference!
    var persona : Personas!
    var storageRef: StorageReference!

    var reference : StorageReference!
    var placeholderImage : UIImage!
    let preferences = UserDefaults.standard
    var nombreUsuario : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference().child("Personas")
        self.storageRef = Storage.storage().reference()
        self.nombreUsuario = preferences.string(forKey: "usuario")
        print(self.nombreUsuario)
        // Al agregarse un usuario nuevo en la BBDD
        /**
         * Recogemos objetos tipo Persona de la BBDD que contienen todos sus datos incluido el link de la foto que le corresponde para mostrarla
         */
        ref.observe(.childAdded, with: { (snapshot) -> Void in
            self.persona = Personas(snapshot: snapshot)
            if self.persona.nombreEntrenador != nil {
                /**
                 * Comprobamos que esa persona disponga de nombre de entrenador y sea el del entrenador que esta dentro
                 */
                if (self.persona.nombreEntrenador?.contains(self.nombreUsuario))!{
                    self.personas.append(self.persona)
                    self.tableView.insertRows(at: [IndexPath(row: self.personas.count-1, section: 0)], with: UITableViewRowAnimation.automatic)
                } else{
                    print("No es su entrenador")
                }
            } else {
                print("Usuario no dispone de nombre de entrenador")
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
        return self.personas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let persona = personas[indexPath.row]
        let idCelda = "CeldaUsuarios"
        
        let celda = tableView.dequeueReusableCell(withIdentifier: idCelda, for: indexPath) as! CeldaUsuario
        celda.nombre.text = persona.nombre
        celda.numero.text = String(persona.numero)
        celda.correo.text = persona.correo
//        Recuperamos la imagen de la nube gracias a la libreria SDWebImage 
        self.placeholderImage = #imageLiteral(resourceName: "foto")
        celda.fotoUsuario.sd_setImage(with: URL(string: persona.foto!), placeholderImage: self.placeholderImage)
        
        return celda
    }
    
    
//    func descargaImagen(){
//        Creo que coge la url donde se guardaria en el telefono
//        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        let documentsDirectory = paths[0]
//        let filePath = "file:\(documentsDirectory)/\(self.persona.correo)"
//        guard let fileURL = URL.init(string: filePath) else { return }
//        URL de la foto en la nube
//        let storagePath = "image/\(self.persona.correo)"
//        // [START downloadimage]
//        storageRef.child(storagePath).write(toFile: fileURL, completion: { (url, error) in
//            if let error = error {
//                print("Error downloading:\(error)")
//                return
//            } else if let imagePath = url?.path {
//                self.persona.fotoPerfil = UIImage.init(contentsOfFile: imagePath)
//            }
//        })
//        // [END downloadimage]
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let numeroCelda = self.tableView.indexPathForSelectedRow{
            let clienteElegido = self.personas[numeroCelda.row]
            preferences.set(clienteElegido.usuario, forKey: "usuario")
        }
    }
    
}

