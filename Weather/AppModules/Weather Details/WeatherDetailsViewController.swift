//
//  WeatherDetailsViewController.swift
//  Weather
//
//  Created by Mohamed Gamal on 7/24/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit
import Kingfisher

class WeatherDetailsViewController: UIViewController {
    
    var data: CityModel?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var maxDegree: UILabel!
    @IBOutlet weak var minDegree: UILabel!
    @IBOutlet weak var currentDegree: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }

    func loadData(){
        WeatherRequest.weather(id: data?.id ?? 0).send(WeatherResponse.self) { (response) in
            switch response{
            case .success(let value):
                print(value)
                self.currentDegree.text = "\(value.main?.temp ?? 0)"
                self.minDegree.text = "\(value.main?.tempMin ?? 0)"
                self.maxDegree.text = "\(value.main?.tempMax ?? 0)"
                self.descriptionLabel.text = "\(value.name ?? "")"
//                let url = URL(string: "weather3")
//                self.img.kf.setImage(with: url)
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
