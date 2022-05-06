//
//  CompleteToDoViewController.swift
//  Wong Project
//
//  Created by Wong, Jacqueline on 5/6/22.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeTapped(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo.name
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
