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
    
    @IBAction func bIniciarSesion(_ sender: UIButton) {
        if let email = self.correoField.text, let password = self.passField.text {
            print(email,password)
            // [START headless_email_auth]
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                // [START_EXCLUDE]
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                // [END_EXCLUDE]
                print(user?.uid ?? "UID")
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
    

}
