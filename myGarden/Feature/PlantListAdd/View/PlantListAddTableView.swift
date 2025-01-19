//
//  PlantListAddTableView.swift
//  myGarden
//
//  Created by zeze kim on 1/20/25.
//

import RxSwift
import UIKit

final class PlantListAddTableView : UITableView {
    private let disposeBag = DisposeBag()
 
       init() {
           super.init(frame: .zero, style: .plain)
           setupTableView()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func setupTableView() {
           self.rowHeight = UITableView.automaticDimension
           self.estimatedRowHeight = 120
           self.register(UITableViewCell.self, forCellReuseIdentifier: "PlantCell")
       }
 
    
}
