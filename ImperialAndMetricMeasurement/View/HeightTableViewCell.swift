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

    func configVehicleHeightCell(_ value : Float){
        heightSlider.value = value
        heightLabelTitle.text = "Height"
        
        
        let meters  = Int((value) / 100)
        let centimeters  = Int(value.truncatingRemainder(dividingBy: 100))
        let inches = Int(value) < 3 ? 0 : round((value) / 2.54)
        let feet = Int(round(inches / 12))
        let inch = Int(round(inches.truncatingRemainder(dividingBy: 12)))
        
        heightFeetsLabel.text = "\(feet) ft" + " \(inch)\""
        heightMetersLabel.text = "\((meters)) m" + " \((centimeters)) cm"
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        
        configVehicleHeightCell((sender.value))
    }
}
