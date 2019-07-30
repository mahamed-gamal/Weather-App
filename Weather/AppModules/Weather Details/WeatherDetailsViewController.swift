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
    
    @IBOutlet weak var holderStack: UIStackView!
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
                self.currentDegree.text = Converter.fahrenheitToCelsius(tempInF:  value.main?.temp ?? 0).rounded().string
                self.minDegree.text = Converter.fahrenheitToCelsius(tempInF: value.main?.tempMin ?? 0).rounded().string
                self.maxDegree.text = Converter.fahrenheitToCelsius(tempInF: value.main?.tempMax ?? 0).rounded().string
                self.descriptionLabel.text = value.sys?.country
                self.animateLabels()
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    func animateLabels(){
        UIView.animate(withDuration: 0.3) {
            self.holderStack.subviews.forEach({ (view) in
                view.isHidden = false
            })
        }
    }
}


