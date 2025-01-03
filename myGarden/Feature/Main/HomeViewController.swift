//
//  HomeViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit
//import SnapKit
import CoreData

class HomeViewController : BaseViewController {
    var managedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        print("HomeViewController")
        self.view.backgroundColor  = .yellow
        
                let button = UIButton(type: .system)
                button.setTitle("deleteAllUserData", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .systemBlue
                button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                view.addSubview(button)
    }
    @objc func buttonTapped() {
        UserDefaults.standard.removeObject(forKey: "isFirstTime")
    }
}
