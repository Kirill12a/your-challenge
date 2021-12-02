//
//  WriteTextTaskVC.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 02.12.2021.
//

import UIKit

/// Экран, на котором идет заполнение задачаи 
class WriteTextTaskVC: UIViewController {

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
    //Сделать анимацию для появления картинок
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
        
       
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        trallingRightImageConstarint.constant = -200
        leadingLeftImageConstraint.constant = -200
        constraintSecondTFTralling.constant = -200
        constarintButtonADdTask.constant = -200
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
