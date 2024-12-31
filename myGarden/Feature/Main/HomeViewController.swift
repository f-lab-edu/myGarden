//
//  HomeViewController.swift
//  MyForest
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
    }
    
}
