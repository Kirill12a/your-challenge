import UIKit


struct modelData{ // вынести потом в отдельный класс
    var task:String
    var deadLine:String
}
//



class ViewController: UIViewController, SendDataInFirstVCDelegate {
    
    
    var timer = Timer()
        let delay = 0.5
    
    
    @IBOutlet weak var nextScreenButtonOutlet: UIButton!
    
    var writeScreen = WriteTextTaskVC()

    var array4s = [modelData]()
    var model: modelData!
    

    override func loadView() {
        super.loadView()
    
        print("Создали")
        print("Элементы массива равны: \(array4s)")
        

    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        

        
  
    }
            // нажатие на плюс
//    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
//        print("Hi")
//
//
//    //MARK: - Блок анимации
//        UIView.animate(withDuration: 2, delay: 0.5, options: .curveEaseInOut) {
//            self.addTaskButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//        } completion: {  _ in
//            ShowViewController.showFunc.showMainApp(nameViewIdentifier: "CreateTaskVC")
//        }
//
//    }
    
    
    // не работает
    var valueOne = ""
    var valueTwo = ""
    func sendData(dataOne: String, dataTwo: String) {
        valueOne = dataOne
        valueTwo = dataTwo
        
        var createArray = modelData(task: valueOne, deadLine: valueTwo)
        array4s.append(createArray)
        
        print(array4s)
    }// не работает(выше)

    @IBAction func NextScreen(_ sender: Any) {
        
    }
    

}

