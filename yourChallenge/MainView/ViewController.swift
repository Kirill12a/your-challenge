import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addTaskButton: UIImageView!{
        didSet{
            print("кнопка создана®")
        }
    }
    @IBOutlet weak var doneButton: UIButton!{
        didSet{

        }
    }
    @IBOutlet weak var historyButton: UIButton!{
        didSet{
            
        }
    }
    
    
    override func loadView() {
        super.loadView()
        CorenerRadiusMainTwoButtons.radiusMainTwoButtons.buttonCustomization(button: doneButton, button: historyButton) // радиус для двух кнопок задается с с другого класса.
        

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
                self.showMainApp()
        }

    }
    
    
    func showMainApp(){
        let mainAppViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CreateTaskVC")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window{
            
            window.rootViewController = mainAppViewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }


}

