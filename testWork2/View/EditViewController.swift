//
//  EditViewController.swift
//  testWork2
//
//  Created by кирилл корнющенков on 06/10/2019.
//  Copyright © 2019 кирилл корнющенков. All rights reserved.
//

import UIKit
import CoreData


class EditViewController: UIViewController {
    var car:[Cars] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtom(_ sender: UIBarButtonItem) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        yearsContent.text = years
        manufacturerConent.text = manufacturer
        carBodeContent.text = carBody
        modelContent.text = model
    }
    
    var years:String?
    var manufacturer:String?
    var model:String?
    var carBody:String?
    var index:Int?
    @IBOutlet weak var yearsContent: UITextField!
    @IBOutlet weak var manufacturerConent: UITextField!
    @IBOutlet weak var carBodeContent: UITextField!
    @IBOutlet weak var modelContent: UITextField!
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (yearsContent.text != "" && manufacturerConent.text != "" && carBodeContent.text != "" && modelContent.text != ""){
            let name = car[index!]
            name.carBody = carBodeContent.text
            name.years = yearsContent.text
            name.manufacturer = manufacturerConent.text
            name.model = modelContent.text
            car[index!] = name
            
            let vc = segue.destination as! ViewController
            vc.car = car
            
            do{
                try context.save()
            }catch{}
            
        }else{
            let alert = UIAlertController(title: "Заполните все поля", message: nil, preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }

}
