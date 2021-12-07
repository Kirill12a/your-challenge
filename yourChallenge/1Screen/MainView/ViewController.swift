import UIKit

struct modelData{ // вынести потом в отдельный класс
    var task:String
    var deadLine:String
}

class ViewController: UIViewController, SendDataInFirstVCDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var timer = Timer()
        let delay = 0.5
    
    
    @IBOutlet weak var nextScreenButtonOutlet: UIButton!
    
    var writeScreen = WriteTextTaskVC()

    var array4s = [modelData]()
    var model: modelData!
    

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func loadView() {
        super.loadView()
        
        collectionView.backgroundColor = .yellow
        collectionView.layer.cornerRadius = 30
        if !array4s.isEmpty{
            print("Пустой ")
            topConstraint.constant = 200
        }else{
            print("не Пустой ")

            topConstraint.constant = -300
            
        }
        
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
  
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !array4s.isEmpty{
            topConstraint.constant = 0
            UIView.animate(withDuration: 2) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // не работает
    var valueOne = ""
    var valueTwo = ""
    func sendData(dataOne: String, dataTwo: String) {
        valueOne = dataOne
        valueTwo = dataTwo
        
        var createArray = modelData(task: valueOne, deadLine: valueTwo)
        array4s.append(createArray)
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    @IBAction func NextScreen(_ sender: Any) {
        // я сдела переход через storyboard
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array4s.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionVC
        cell.oneCell.text = array4s[indexPath.row].task
        cell.twoCell.text = array4s[indexPath.row].deadLine
        
        cell.viewCell.layer.cornerRadius = 30
        cell.viewCell.layer.borderWidth = 2
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            let destination = segue.destination as! WriteTextTaskVC
            destination.delegate = self
        }
    }
    
    
    
    

}

