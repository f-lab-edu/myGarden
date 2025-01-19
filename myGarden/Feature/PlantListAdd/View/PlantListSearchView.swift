//
//  PlantListSearchView.swift
//  myGarden
//
//  Created by zeze kim on 1/20/25.
//

import UIKit

class PlantListSearchView : BaseUIView {
    var viewModel: PlantListAddViewModel?
    
    lazy var plantSearchView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorChart.background
        view.layoutMargins = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        view.layer.cornerRadius = 10
        view.layer.borderColor = ColorChart.primaryAsh.cgColor
        view.layer.borderWidth = 1.0
        view.layer.masksToBounds = true
        return view
    }()
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "식물 이름을 입력하세요"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    init(viewModel: PlantListAddViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        button.backgroundColor = ColorChart.primary
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func configure() {
        addSubview(plantSearchView)
        plantSearchView.addSubview(searchTextField)
        plantSearchView.addSubview(searchButton)
    }
    override func setConstraints() {
        self.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(80)
        }
        plantSearchView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        searchTextField.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(searchButton.snp.leading).offset(-8)
            make.height.equalTo(40)
        }
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(80)
        }
    }
    override func configureBindings() {
        searchTextField.rx.text
            .orEmpty
            .bind(to: viewModel!.plantKeyword)
            .disposed(by: viewModel!.disposeBag)
    }
    
    @objc func searchButtonTapped() {
        viewModel!.searchButtonTapped()
    }
}
