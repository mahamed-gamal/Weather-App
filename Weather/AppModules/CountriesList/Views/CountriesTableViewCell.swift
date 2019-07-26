//
//  CountriesTableViewCell.swift
//  Weather
//
//  Created by Mohamed Gamal on 7/25/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: class{
    func didTap(_ button: UIButton , cell: UITableViewCell)
}

class CountriesTableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?
    @IBOutlet weak var mapBtn: UIButton!
    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressedOnMapBtn(_ sender: UIButton) {
        delegate?.didTap(sender, cell: self)
    }
}
