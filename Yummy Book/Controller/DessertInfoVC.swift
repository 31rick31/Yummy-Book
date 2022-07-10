//
//  DessertInfoVC.swift
//  Yummy Book
//
//  Created by Ricky Memije on 6/30/22.
//

import UIKit

class DessertInfoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dessertTitle: UILabel!
    @IBOutlet weak var dessertImage: UIImageView!
    @IBOutlet weak var dessertInstructions: UILabel!
    @IBOutlet weak var meaIngTV: UITableView!
    
    let ingMeaCell = "micell"
    
    let ing: [String] = MealsManger.mealIdInfo.ingredients
    let mea: [String] = MealsManger.mealIdInfo.measurements
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        meaIngTV.dataSource = self
        meaIngTV.delegate = self

        dessertTitle.text = MealsManger.mealIdInfo.title
        dessertImage.loadFrom(URLAddress: MealsManger.mealIdInfo.thumb!)
        dessertInstructions.text = MealsManger.mealIdInfo.instructions
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ing.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ingMeaCell, for: indexPath) as! IngMeaTableViewCell
        
        cell.ingCellLabel.text = ing[indexPath.row]
        cell.meaCellLabel.text = mea[indexPath.row]
        
        return cell
    }


}




extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string:  URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
