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

/// Экран, на котором идет заполнение задачаи 
class WriteTextTaskVC: UIViewController, UITextFieldDelegate {
    var modelData: ModelWriteDataTask?
    
    var delegate: SendDataInFirstVCDelegate? // delegate

    
    @IBOutlet weak var constarintButtonADdTask: NSLayoutConstraint!
    @IBOutlet weak var constraintSecondTFTralling: NSLayoutConstraint!
  
    @IBOutlet weak var writeTaskTF: UITextField!{
        didSet{
            writeTaskTF.layer.cornerRadius = 21.0
        }
    }
    @IBOutlet weak var writeDataTF: UITextField!{
        didSet{
        writeDataTF.layer.cornerRadius = 21.0
        }
    }
    @IBOutlet weak var createTaskButtonOutlet: UIButton!{
        didSet{
            createTaskButtonOutlet.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var trallingRightImageConstarint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingLeftImageConstraint: NSLayoutConstraint!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.viewDidLoad()
        self.trallingRightImageConstarint.constant = 8
        self.leadingLeftImageConstraint.constant =  8
        self.constraintSecondTFTralling.constant = 50
        self.constarintButtonADdTask.constant = 372
       
        
        UIView.animate(withDuration: 1.5, delay: 0, options: [.beginFromCurrentState], animations: {
            self.view.layoutIfNeeded()
        })
    }
        // нажатие кнопки
    @IBAction func createTaskButton(_ sender: UIButton) {
        var viewControllerFirst = ShowViewController.showFunc.showMainApp(nameViewIdentifier: "ViewController")
        
        let textOne = writeTaskTF.text
        let textTwo = writeDataTF.text
        delegate?.sendData(dataOne: textOne!, dataTwo: textTwo!)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.writeDataTF.delegate = self
        self.writeTaskTF.delegate = self
        
    }
    
    /// Чтобы при нажжатие done совершался переход на next textField - ()
    /// - Parameter textField: текст филд, заданный в коде
    /// - Returns: да или нет
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
        trallingRightImageConstarint.constant = -200
        leadingLeftImageConstraint.constant = -200
        constraintSecondTFTralling.constant = -200
        constarintButtonADdTask.constant = -200
    }
}

