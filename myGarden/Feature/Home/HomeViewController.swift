//
//  HomeViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit


class HomeViewController : BaseViewController {
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layoutIfNeeded()
        print("HomeViewController")
        view.backgroundColor  = .yellow
        let button = UIButton(type: .system)
        button.setTitle("deleteAllUserData", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
    }
    @objc func buttonTapped() {
        viewModel.reset()
    }
}
