//
//  PopUpViewController.swift
//  ImperialAndMetricMeasurement
//
//  Created by Florentin Lupascu on 27/03/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol HeightPopUpDelegate {
    func receiveHeightMetric(centimeters: Int?)
    func receiveHeightImperial(feet: Int?, inches: Int?)
}

class PopUpViewController: UIViewController {

    // Interface Links
    @IBOutlet weak var centimetersTextField: UITextField!
    @IBOutlet weak var feetTextField: UITextField!
    @IBOutlet weak var inchesTextField: UITextField!
    @IBOutlet weak var labelForOr: UILabel!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var cancelBtnOutlet: UIButton!
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    // Properties
    var delegate: HeightPopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // Dismiss the popup when user press the Cancel btn
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // Save the data and send it back when user press the Save btn
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
        checkImperialOrMetricTextfields()
        dismiss(animated: true, completion: nil)
    }
    
    // Check if the textfields contains Metric or Imperial height. If everything is OK then send the data back.
    func checkImperialOrMetricTextfields(){
        
        if ((!(centimetersTextField.text?.isEmpty)!) && (!(feetTextField.text?.isEmpty)! || !(inchesTextField.text?.isEmpty)!)) {
            
            showAlertWithTitle(title: "Error", message: "Enter either metric OR imperial height.")
            clearTextFields()
        }
        if ((centimetersTextField.text?.isEmpty)! && (feetTextField.text?.isEmpty)! && (inchesTextField.text?.isEmpty)!) {
            
            showAlertWithTitle(title: "Error", message: "Enter either metric OR imperial height.")
            clearTextFields()
        }
        else{
            sendDataBack()
        }
    }
    
    // Clear textfields
    func clearTextFields(){
        
        centimetersTextField.text = ""
        feetTextField.text = ""
        inchesTextField.text = ""
    }
    
    // Function used to send data back from the PopUp to MainVC
    func sendDataBack(){
        
        if delegate != nil{
            delegate?.receiveHeightMetric(centimeters: Int(centimetersTextField?.text ?? "0"))
            delegate?.receiveHeightImperial(feet: Int(feetTextField?.text ?? "0"), inches: Int(inchesTextField?.text ?? "0"))
        }
    }
    
    // Setup the design for outlets
    func setupViews(){
        
        popUpView.layer.cornerRadius = 20
        popUpView.layer.masksToBounds = true
        
        cancelBtnOutlet.layer.cornerRadius = 5
        cancelBtnOutlet.layer.borderWidth = 0.5
        cancelBtnOutlet.layer.borderColor = UIColor.black.cgColor
        
        saveBtnOutlet.layer.cornerRadius = 5
        saveBtnOutlet.layer.borderWidth = 0.5
        saveBtnOutlet.layer.borderColor = UIColor.black.cgColor
    }
    
    // Function to hide the Popup when the user click anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == self.view {
            dismiss(animated: true, completion: nil)
        }
    }
    
    // Show an alert view with Title
    func showAlertWithTitle(title: String = "", message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
