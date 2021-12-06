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

