//
//  showVC.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 01.12.2021.
//

import Foundation
import UIKit


final class ShowViewController{
    

        
    static var showFunc = ShowViewController()
    
    func showMainApp(nameViewIdentifier identifierView: String){
        let mainAppViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: identifierView)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window{
            
            window.rootViewController = mainAppViewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }
}
