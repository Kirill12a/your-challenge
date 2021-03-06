//
//  WriteTextTaskVC.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 02.12.2021.
//

import UIKit

protocol  SendDataInFirstVCDelegate{
    func sendData(dataOne: String, dataTwo: String)
}

class WriteTextTaskVC: UIViewController, UITextFieldDelegate {
    
    var delegate: SendDataInFirstVCDelegate?

    @IBOutlet weak var constarintButtonADdTask: NSLayoutConstraint!
    @IBOutlet weak var constraintSecondTFTralling: NSLayoutConstraint!
    @IBOutlet weak var writeTaskTF: UITextField!{didSet{writeTaskTF.layer.cornerRadius = 21.0}}
    @IBOutlet weak var writeDataTF: UITextField!{didSet{writeDataTF.layer.cornerRadius = 21.0}}
    @IBOutlet weak var createTaskButtonOutlet: UIButton!{didSet{createTaskButtonOutlet.layer.cornerRadius = 12}}
    @IBOutlet weak var trallingRightImageConstarint: NSLayoutConstraint!

    @IBOutlet weak var leadingLeftImageConstraint: NSLayoutConstraint!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.trallingRightImageConstarint.constant = 8
        self.leadingLeftImageConstraint.constant   = 8
        self.constraintSecondTFTralling.constant   = 50
        self.constarintButtonADdTask.constant      = 372
        
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       options: [.beginFromCurrentState],
                       animations: {
                                    self.view.layoutIfNeeded()
        })
        
        let datePicker = UIDatePicker()
                datePicker.datePickerMode           = .date
                datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
                datePicker.frame.size               = CGSize(width: 0, height: 300)
                datePicker.preferredDatePickerStyle = .wheels
                
        writeDataTF.inputView = datePicker
        writeDataTF.text      = formatDate(date: Date())
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        writeDataTF.text = formatDate(date: datePicker.date)
        }
        
        func formatDate(date: Date) -> String{
            let formatter        = DateFormatter()
            formatter.dateFormat = "d.M.yy"
            return formatter.string(from: date)
        }
    
        
    @IBAction func createTaskButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        let textOne = writeTaskTF.text
        let textTwo = writeDataTF.text
        delegate?.sendData(dataOne: textOne!, dataTwo: textTwo!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.writeDataTF.delegate = self
        self.writeTaskTF.delegate = self
        
        _ = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.hidesBackButton = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case writeTaskTF:
            writeDataTF.becomeFirstResponder()
        case writeDataTF:
            textField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false

    }
    
    override func loadView() {
        super.loadView()
        trallingRightImageConstarint.constant = -300
        leadingLeftImageConstraint.constant   = -300
        constraintSecondTFTralling.constant   = -300
        constarintButtonADdTask.constant      = -300
    }
}

