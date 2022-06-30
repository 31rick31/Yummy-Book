//
//  DessertListVC.swift
//  Yummy Book
//
//  Created by Ricky Memije on 6/25/22.
//

import UIKit

class DessertListVC: UITableViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Identifiers
    let reuseIdentifier = "MealCell"
    
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
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let mealsManager = MealsManger()
        
        mealsManager.fetchMeals { (meals) in
            self.mealArray = meals.meals
        }

    }
    
    func getMealItem(id: String){
        let mealsManager = MealsManger()
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        guard let meal = mealArray?[indexPath.row] else { return UITableViewCell() }
        
        cell.textLabel?.text = "\(meal.strMeal ?? "no data")"
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let idToBeSent = mealArray?[indexPath.row].idMeal
        print(idToBeSent!)
        getMealItem(id: idToBeSent!)
        
    }
}
