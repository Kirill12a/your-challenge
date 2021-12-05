import UIKit


struct modelData{
    var task:String
    var deadLine:String
}

class ViewController: UIViewController, SendDataInFirstVCDelegate {
    
    
    
    var writeScreen = WriteTextTaskVC()
    
    
    var array4s = [modelData]()
    var model: modelData!
    
    @IBOutlet weak var addTaskButton: UIImageView!{
        didSet{
            print("кнопка создана®")}
        
    }
    @IBOutlet weak var doneButton: UIButton!{
        didSet{}
        
    }
    @IBOutlet weak var historyButton: UIButton!{
        didSet{}
        
    }
    
    
    override func loadView() {
        super.loadView()
        CorenerRadiusMainTwoButtons.radiusMainTwoButtons.buttonCustomization(button: doneButton, button: historyButton) // радиус для двух кнопок задается с с другого класса.
        
        print("Создали")
        print("Элементы массива равны: \(array4s)")
        

    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        addTaskButton.isUserInteractionEnabled = true
        addTaskButton.addGestureRecognizer(tapGestureRecognizer)
    }
            // нажатие на плюс
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("Hi")
        
        
    //MARK: - Блок анимации
        UIView.animate(withDuration: 2, delay: 0.5, options: .curveEaseInOut) {
            self.addTaskButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        } completion: {  _ in
            ShowViewController.showFunc.showMainApp(nameViewIdentifier: "CreateTaskVC")
        }

    }
    
    var valueOne = ""
    var valueTwo = ""
    func sendData(dataOne: String, dataTwo: String) {
        valueOne = dataOne
        valueTwo = dataTwo
        
        var createArray = modelData(task: valueOne, deadLine: valueTwo)
        array4s.append(createArray)
        
        print(array4s)
    }
    
}

