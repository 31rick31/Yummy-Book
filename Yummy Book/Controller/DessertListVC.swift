//
//  DessertListVC.swift
//  Yummy Book
//
//  Created by Ricky Memije on 6/25/22.
//

import UIKit

class DessertListVC: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Identifiers
    let mealCell = "MealCell"
    let mealsManager = MealsManger()
    
    var mealArray: [Meals]? {
        didSet {
            DispatchQueue.main.async {
                [self] in tableView.reloadData()
            }
        }
    }
    
    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(itemFound), name: .itemLoaded, object: nil)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        mealsManager.fetchMeals { (meals) in
            self.mealArray = meals.meals
        }
        
    }
    
    @objc func itemFound(){
        performSegue(withIdentifier: "showDessert", sender: self)
    }
    
    func getMealItem(id: String){
        
        mealsManager.fetchMealInfo(mealId: id) { (meals) in
            
        }
    }
    
}

//MARK: TableView Functions
extension DessertListVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mealArray?.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: mealCell, for: indexPath)
        
        guard let meal = mealArray?[indexPath.row] else { return UITableViewCell() }
        
        cell.textLabel?.text = "\(meal.strMeal ?? "no data")"
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let idToBeSent = mealArray?[indexPath.row].idMeal
        print(idToBeSent!)
        getMealItem(id: idToBeSent!)
        
    }
}
