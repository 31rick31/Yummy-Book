//
//  DessertSearchVC.swift
//  Yummy Book
//
//  Created by Ricky Memije on 7/9/22.
//

import UIKit

class DessertSearchVC: UITableViewController, UISearchBarDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchMealCell = "SearchMealCell"
    let mealsManager = MealsManger()
    
    var filteredMealsArray: [Meals]!
    var mealArray: [Meals]? {
        didSet {
            DispatchQueue.main.async {
                [self] in tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(itemFound), name: .itemLoaded, object: nil)
        
        searchBar.delegate = self
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        mealsManager.fetchMeals { (meals) in
            self.mealArray = meals.meals
        }
    }
    
    @objc func itemFound(){
        performSegue(withIdentifier: "showDessert2", sender: self)
    }
    
    func getMealItem(id: String){
        
        mealsManager.fetchMealInfo(mealId: id) { (meals) in
            
        }
    }
}

extension DessertSearchVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredMealsArray?.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: searchMealCell, for: indexPath)
        
        guard let meal = filteredMealsArray?[indexPath.row] else { return UITableViewCell() }
        
        cell.textLabel?.text = "\(meal.strMeal ?? "no data")"
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let idToBeSent = filteredMealsArray?[indexPath.row].idMeal
        print(idToBeSent!)
        getMealItem(id: idToBeSent!)
        
    }
    
    // MARK: Searchbar Functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        filteredMealsArray = []
        
         if searchText == "" {
            filteredMealsArray = mealArray
        }
        else {
            
            for dessert in mealArray! {
                if dessert.strMeal!.lowercased().contains(searchText.lowercased()) {
                    
                    filteredMealsArray.append(dessert)
                }
            }
            
        }
        self.tableView.reloadData()

    }
}

