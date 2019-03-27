//
//  HeightTableViewCell.swift
//  ImperialAndMetricMeasurement
//
//  Created by Florentin Lupascu on 27/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol HeightCellDelegate {
    func heightSliderValueChanged(_ slider: UISlider, _ feetsLabel: UILabel, _ metersLabel: UILabel)
}

class HeightTableViewCell: UITableViewCell {

    // Interface Links
    @IBOutlet weak var heightLabelTitle: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightFeetsLabel: UILabel!
    @IBOutlet weak var heightMetersLabel: UILabel!
    
    // Properties
    var delegate: HeightCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configVehicleHeightCell(){
        
        heightLabelTitle.text = "Height"
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        
        delegate?.heightSliderValueChanged(heightSlider, heightFeetsLabel, heightMetersLabel)
    }
}
