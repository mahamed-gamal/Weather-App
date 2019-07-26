//
//  CountriesListViewController.swift
//  Weather
//
//  Created by Mohamed Gamal on 7/22/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit


class CountriesListViewController: UIViewController {
    
    var tableData = Cities()
    
    
    lazy var tapButton: UIBarButtonItem = {
         return UIBarButtonItem(title: "Map", style: .plain, target: self, action: #selector(openMaps))
    }()
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setLeftBarButton(tapButton, animated: true)
        title = "Countries"
        tableView.delegate = self
        tableView.dataSource = self
        let cell = UINib(nibName: "CountriesTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "UITableViewCell")
        loadData()

    }
    
    
    @objc func openMaps() {
        let vc = MapViewFactory.MakeMapWithNavigation()
        present(vc, animated: true, completion: nil)
    }
    
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "city.list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                tableData = try decoder.decode(Cities.self, from: data)
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

}

extension CountriesListViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = tableData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath) as! CountriesTableViewCell
        cell.countryName.text = data.country
        cell.delegate = self

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = tableData[indexPath.row]
        let vc = WeatherDetailsViewController()
        vc.data = city
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension CountriesListViewController: TableViewCellDelegate {
    func didTap(_ button: UIButton, cell: UITableViewCell) {
        guard let index = tableView.indexPath(for: cell) else {return}
        let data = tableData[index.row]
        let vc = MapViewFactory.MakeMapWith((data.coord.lon , data.coord.lat))
        navigationController?.pushViewController(vc, animated: true)
    }
}
