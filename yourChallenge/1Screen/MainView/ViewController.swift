import UIKit
import RealmSwift

// нужно сделать красоту в коде
// сделаит анимацию нормульную
// потом добавить удаление данных при нажатие


@objcMembers
class modelData: Object{ // вынести потом в отдельный класс
    dynamic  var task = ""
    dynamic var deadLine = ""
}

class ViewController: UIViewController, SendDataInFirstVCDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var realm: Realm!
    
    var toDoList: Results<modelData>{
        get{
            return realm.objects(modelData.self)
        }
    }
    
    
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

//            topConstraint.constant = -300
            topConstraint.constant = 50

            
        }
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        realm = try! Realm()

  
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
    
    
    
    var valueOne = ""
    var valueTwo = ""
    func sendData(dataOne: String, dataTwo: String) {
        valueOne = dataOne
        valueTwo = dataTwo
        
//        var createArray = modelData(task: valueOne, deadLine: valueTwo)
//        array4s.append(createArray)
        
        let newToDoListItem = modelData()
        newToDoListItem.task = valueOne
        newToDoListItem.deadLine = valueTwo
        
        try! self.realm.write({
            self.realm.add(newToDoListItem)
            self.collectionView.insertItems(at: [IndexPath.init(row: self.toDoList.count - 1, section: 0)])
        })
        
        
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    @IBAction func NextScreen(_ sender: Any) {
        // я сдела переход через storyboard
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionVC
//        cell.oneCell.text = array4s[indexPath.row].task
//        cell.twoCell.text = array4s[indexPath.row].deadLine
        
        let item = toDoList[indexPath.row]
        cell.oneCell.text = item.task
        cell.twoCell.text = item.deadLine
        
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

