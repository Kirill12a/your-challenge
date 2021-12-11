
import UIKit

// из этого в V2 будет onboarding

class CreateTaskVC: UIViewController {
    
    @IBOutlet weak var welcomeTextSV: UIStackView! {
        didSet{
            welcomeTextSV.transform = CGAffineTransform(rotationAngle:37.3)
        }
    }

    @IBOutlet weak var welcomTextSecondSV: UIStackView! { // напиши
        didSet{
            welcomTextSecondSV.transform = CGAffineTransform(rotationAngle: 38.2)
        }
    }

    @IBOutlet weak var goToTheTaskCreationScreen: UIButton!{
        didSet{
            goToTheTaskCreationScreen.layer.cornerRadius = 15
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBtn = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.hidesBackButton = true
    }
}
