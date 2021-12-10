import UIKit
import RealmSwift


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var collectionView: UICollectionView!
    
    
   
    var realm: Realm!
    
    var toDoList: Results<ModeslData>!{get{return realm.objects(ModeslData.self)}}
    
    @IBOutlet weak var nextScreenButtonOutlet: UIButton!

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func loadView() {
        super.loadView()
       
        collectionView.backgroundColor    = .yellow
        collectionView.layer.cornerRadius = 30

    }
    
    

    override func viewDidLoad(){
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate   = self
        
        realm = try! Realm()

        if !toDoList.isEmpty{
            print("Не пустой")
            topConstraint.constant = 0
            
            UIView.animate(withDuration: 1.5) {
                self.view.layoutIfNeeded()
            }
    
        }else{
            
            topConstraint.constant = 0
            UIView.animate(withDuration: 1.5) {
                self.view.layoutIfNeeded()
            }

        }
  
    }
  
    

    var valueOne = ""
    var valueTwo = ""
    

    @IBAction func NextScreen(_ sender: Any) {
        // сдела переход через storyboard
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionVC
        
        let item = toDoList[indexPath.row]
        cell.oneCell.text = item.task
        cell.twoCell.text = item.deadLine
        
        cell.viewCell.layer.cornerRadius = 30
        cell.viewCell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        try! realm.write({
            let item = toDoList[indexPath.row]
            self.realm.delete(toDoList[indexPath.row])
        })
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            let destination = segue.destination as! WriteTextTaskVC
            destination.delegate = self
        }
    }
    
    
    func reloadData(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}



extension ViewController: SendDataInFirstVCDelegate{
    func sendData(dataOne: String, dataTwo: String) {
        valueOne = dataOne
        valueTwo = dataTwo
        
        let newToDoListItem = ModeslData()
        newToDoListItem.task = valueOne
        newToDoListItem.deadLine = valueTwo
        
        try! self.realm.write({
            self.realm.add(newToDoListItem)
            self.collectionView.insertItems(at: [IndexPath.init(row: self.toDoList.count - 1, section: 0)])
        })

        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
