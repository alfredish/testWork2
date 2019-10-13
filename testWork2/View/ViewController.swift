//
//  ViewController.swift
//  testWork2
//
//  Created by кирилл корнющенков on 05/10/2019.
//  Copyright © 2019 кирилл корнющенков. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    var car:[Cars] = []
    @IBOutlet weak var tableView: UITableView!
    var index:Int?
    
     //MARK: - load
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.tableFooterView = UIView()
    }
    //загрузка данных из coreData
    override func viewWillAppear(_ animated: Bool) {
        
        let fetchRequest:NSFetchRequest<Cars> = Cars.fetchRequest()
        do {
            car = try context.fetch(fetchRequest)
        }catch{
        }
        
        tableView.reloadData()
    }
    
    //MARK: - TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return car.count
     }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.manufacturerLabel.text = car[indexPath.row].manufacturer
        cell.modelLabel.text = car[indexPath.row].model
        cell.carBodyLabel.text = car[indexPath.row].carBody
        cell.yearsLabel.text = car[indexPath.row].years
        
        return cell
     }
     
    
    //удаление из базы данных
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let name = car[indexPath.row]
            context.delete(name)
            do{
                try context.save()
            }catch{
                
            }
            car.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "edit", sender: nil)
        
    }
    
    
    //MARK: - bar buttom item add
    @IBAction func addData(_ sender: Any) {
        performSegue(withIdentifier: "show", sender: nil)
    }
    
    
    @IBAction func home(sender:UIStoryboardSegue){
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit"{
            let vc = segue.destination as! EditViewController
            vc.years = car[index!].years
            vc.carBody = car[index!].carBody
            vc.manufacturer = car[index!].manufacturer
            vc.model = car[index!].model
            vc.index = index!
            vc.car = car
        }
    }
    
}

