//
//  APIUTils.swift
//  AppRecordar1.0
//
//  Created by User on 6/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation
import UIKit

//Variables Externas
let CONSTANTES = Constantes()
let taskManager = APITaskManager.sharedInstance


struct Constantes {
    
    let KEY_TAREAS = "tasks"
    let KEY_TITULO = "titulo"
    let KEY_ICONO_IMAGEN = "imagen"
    let USER_DEFAULT = UserDefaults.standard
    let COLOR_BORRAR_AZUL = UIColor(red: 26/255, green: 71/255, blue: 102/255, alpha: 1.0)
    
}
