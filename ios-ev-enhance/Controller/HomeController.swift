//
//  ViewController.swift
//  ios-ev-enhance
//
//  Created by carson tham on 6/4/24.
//

import UIKit

class HomeController: UIViewController{

    var chargerPoints: [Charger] = []
    @IBOutlet weak var chargerTable: UITableView!
    
    override func viewDidLoad() {
        populateTable(arr: &chargerPoints)
        newBtn.layer.cornerRadius = 15
        newBtn.clipsToBounds = true
        super.viewDidLoad()
        chargerTable.dataSource = self
    }
    @IBOutlet var newBtn: UIButton!
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }

}

extension HomeController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chargerPoints.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 80
        let cell = tableView.dequeueReusableCell(withIdentifier: "chargerCell", for: indexPath) as! ChargerCell


        let name = chargerPoints[indexPath.row].company_operator
        let dist = chargerPoints[indexPath.row].distance
        let location = chargerPoints[indexPath.row].location
        cell.company.text = name
        cell.distance.text = dist
        cell.location.text = location
        
        return cell
    }
}
