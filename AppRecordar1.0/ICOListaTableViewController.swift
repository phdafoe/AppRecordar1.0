//
//  ICOListaTableViewController.swift
//  AppRecordar1.0
//
//  Created by User on 2/1/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ICOListaTableViewController: UITableViewController {
    
    
    //MARK: - IBActions
    @IBAction func añadirNuevaTarea(_ sender: Any) {
        
        let alertVC = UIAlertController(title: "Nueva tarea", message: "Nombre de la Tarea", preferredStyle: .alert)
        alertVC.addTextField(configurationHandler: nil)
        alertVC.addAction(UIAlertAction(title: "Guardar", style: .default, handler: { (alertAction) in
            
            if let textFieldTextDes = alertVC.textFields?.first?.text{
                taskManager.tasks.append([CONSTANTES.KEY_TITULO : textFieldTextDes])
                self.tableView.reloadData()
            }
            
        }))
        alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskManager.tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ICOTaskCustomCell

        let task = taskManager.tasks[indexPath.row]
        cell.myTextoTarea.text = task[CONSTANTES.KEY_TITULO]
        if let imageDes = task[CONSTANTES.KEY_ICONO_IMAGEN]{
            cell.myImagenIconTarea.image = UIImage(named: imageDes)
        }else{
            cell.myImagenIconTarea.image = UIImage(named: "img_no_icon")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let borrar = UITableViewRowAction(style: .normal, title: "Borrar", handler: { (action, indexPath)  in
            taskManager.tasks.remove(at: indexPath.row)
            self.tableView.reloadData()
        })
        borrar.backgroundColor = CONSTANTES.COLOR_BORRAR_AZUL
        return [borrar]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
