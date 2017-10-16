//
//  ViewControllerUsuarios.swift
//  Entrenamiento
//
//  Created by Eric Martin Gálan on 24/9/17.
//  Copyright © 2017 Eric Martin Gálan. All rights reserved.
//

import UIKit

class ViewControllerUsuarios: UITableViewController {
    
    var usuarios : [Personas] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usuarios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let usuario = usuarios[indexPath.row]
        let idCelda = "CeldaUsuarios"
        
        let celda = tableView.dequeueReusableCell(withIdentifier: idCelda, for: indexPath)
        
        celda.textLabel?.text = usuario.nombre
        return celda
    }
    



}

