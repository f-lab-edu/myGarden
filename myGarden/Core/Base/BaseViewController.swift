//
//  BaseViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
    }
    

     func configureView(){
         // 뷰의 스타일이나 기타 설정을 담당
         // 버튼 추가하거나 색상 글꼴
         

    }
    func setConstraints(){
        // 레이아웃 제약을 설정

    }
    override func viewWillAppear(_ animated: Bool) {
        Themes.updateTheme()
      
    }
    
}
