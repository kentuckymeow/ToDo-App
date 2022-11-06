//
//  ViewController.swift
//  ToDo App
//
//  Created by Arseni Khatsuk on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
        //if Core.shared.isNewUser() {
            // Show onboarding
            let vs =  WelcomeViewController()
            vs.modalPresentationStyle = .fullScreen
            present(vs, animated: true)
        //}
        
    }
    


}

class Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
        
    }
}

