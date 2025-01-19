//
//  PlantInpurView.swift
//  myGarden
//
//  Created by zeze kim on 1/19/25.
//
import UIKit
class PlantInputView: BaseUIView {
    var viewModel: PlantListAddViewModel?

    lazy var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.backgroundColor = ColorChart.background
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = ColorChart.primaryAsh.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "식물 애칭"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = ColorChart.text
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.backgroundColor = .clear
        textField.textAlignment = .right
        textField.borderStyle = .none
        return textField
    }()
    
    lazy var dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.backgroundColor = ColorChart.background
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = ColorChart.primaryAsh.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.masksToBounds = true
        return stackView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "키우기 시작한 날짜"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.locale = Locale(identifier: "ko_KR")
        picker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        return picker
    }()
    
    init(viewModel: PlantListAddViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        addSubview(nameStackView)
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)

        addSubview(dateStackView)
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(datePicker)
    }
    
    override func setConstraints() {
        self.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(130)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        dateStackView.snp.makeConstraints { make in
            make.top.equalTo(nameStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    @objc func dateChanged(picker: UIDatePicker) {
        viewModel?.dateChanged(picker: picker)
    }
}
