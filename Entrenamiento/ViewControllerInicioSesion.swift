//
//  ViewControllerInicioSesion.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 14/10/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import UIKit
import Firebase

class ViewControllerInicioSesion: UIViewController {
    
    @IBOutlet var correoField: UITextField!
    @IBOutlet var passField: UITextField!
    var entrenador : String = ""
    var ref: DatabaseReference!

    @IBAction func bIniciarSesion(_ sender: UIButton) {
        if let email = self.correoField.text, let password = self.passField.text {
            // [START headless_email_auth]
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                // [START_EXCLUDE]
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                // [END_EXCLUDE]
                    self.ref = Database.database().reference().child("Usuarios").child((user?.uid)!)
                    self.ref.observeSingleEvent(of: .value, with: { (snapshot) in
                        let username = snapshot.value as? String ?? ""
                        self.guardarUsuario(correo: email, pass: password, usuario: username)
                        self.ref = Database.database().reference().child("Personas").child(username).child("entrenador");
                            self.ref.observeSingleEvent(of: .value, with: { (snapshot) in
                                self.entrenador = snapshot.value as? String ?? ""
                                if self.entrenador.contains("si") {
                                    self.performSegue(withIdentifier: "segueUsuarios", sender: self)
                                    print ("Entrenador")
                                } else {
                                    self.performSegue(withIdentifier: "segueRutinas", sender: self)
                                    print ("Normal")
                                }
                                
                                
                            })
                    })
            }
            // [END headless_email_auth]
        } else {
            print("Vacio")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func guardarUsuario (correo:String, pass:String, usuario:String){
        let preferences = UserDefaults.standard
        preferences.set(correo, forKey: "correo")
        preferences.set(pass, forKey: "pass")
        preferences.set(usuario, forKey: "usuario")
        // Checking the preference is saved or not
        didSave(preferences: preferences)
    }
    
    func guardarEntrenador (esEntrenador:String){
        let preferences = UserDefaults.standard
        preferences.set(esEntrenador, forKey: "entrenador")
        // Checking the preference is saved or not
        didSave(preferences: preferences)
    }
    
    
    // Comprueba si estan guardadas las preferencias o no
    func didSave(preferences: UserDefaults){
        let didSave = preferences.synchronize()
        if !didSave{
            // No lo estan
            print("Preferences could not be saved!")
        }
    }
}
