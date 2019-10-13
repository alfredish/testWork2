//
//  AddViewController.swift
//  testWork2
//
//  Created by кирилл корнющенков on 05/10/2019.
//  Copyright © 2019 кирилл корнющенков. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        yearsContent.text = ""
        manufacturerConent.text = ""
        carBodeContent.text = ""
        modelContent.text = ""
    }

    @IBOutlet weak var yearsContent: UITextField!
    @IBOutlet weak var manufacturerConent: UITextField!
    @IBOutlet weak var carBodeContent: UITextField!
    @IBOutlet weak var modelContent: UITextField!
    
    
    
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (yearsContent.text != "" && manufacturerConent.text != "" && carBodeContent.text != "" && modelContent.text != ""){
            let entity = NSEntityDescription.entity(forEntityName: "Cars", in: context)
            let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Cars
            taskObject.carBody = carBodeContent.text
            taskObject.manufacturer = manufacturerConent.text
            taskObject.model = modelContent.text
            taskObject.years = yearsContent.text
                
            do{
                try context.save()
            }catch{
                
            }
        }else{
            let alert = UIAlertController(title: "Заполните все поля", message: nil, preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
