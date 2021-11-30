import UIKit
/*
 MARK: - Задача
 1) Сделать первый экран: Добавить анимацию; Добавить отрисовку всех элементов
 2)
 */

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

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print("Hi")
        
        
        // что просоходит при нажатие на фотку(ниже)
        // пробую добавить анимацию || анимация работает, теперь нужно довести до ума ее.
        UIView.animate(withDuration: 3.9) { [self] in
            addTaskButton.alpha = 0
            
        }
    }


}

