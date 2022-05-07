//
//  ToDoTableViewController.swift
//  Wong Project
//
//  Created by Wong, Jacqueline on 5/5/22.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDoCD] = []
    
    func getToDos() {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                toDos = coreDataToDos
                tableView.reloadData()
        }
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
            
    
    }

    func createToDos() -> [ToDo] {
        
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        
        return [swift, dog]
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

      let toDo = toDos[indexPath.row]

      if let name = toDo.name {
        if toDo.important {
            cell.textLabel?.text = "❗️" + name
        } else {
            cell.textLabel?.text = toDo.name
        }
      }

      return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      let toDo = toDos[indexPath.row]

      performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }

   
    override func viewWillAppear(_ animated: Bool) {
      getToDos()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousVC = self
      }
        if let completeVC = segue.destination as? CompleteToDoViewController {
          if let toDoCD = sender as? ToDoCD {
              completeVC.selectedToDo = toDoCD
            completeVC.previousVC = self
          }
        }
     
    }
}
