//
//  PlantListAddView.swift
//  myGarden
//
//  Created by zeze kim on 1/19/25.
//

import UIKit
import RxSwift


final class PlantListAddViewController : BaseViewController{
    
    //스크롤뷰(검색  +  애칭 +  키우기 시작한날짜  )
    final var viewModel = PlantListAddViewModel()
    private let disposeBag = DisposeBag()
    
    
    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorChart.background
        view.clipsToBounds = true
        return view
    }()
    
    lazy var contentView : UIView = {
        let view = UIView()
        view.backgroundColor = ColorChart.backgroundLight
        return view
    }()
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    lazy var plantSearchView : PlantListSearchView = {
        let view = PlantListSearchView(viewModel: viewModel)
        return view
    }()
    
    lazy var tableView: PlantListAddTableView = {
        let table = PlantListAddTableView()
        table.backgroundColor = .orange
        table.delegate = self
        table.dataSource = self
       
        return table
    }()
    
    lazy var plantInputView: PlantInputView = {
        let view = PlantInputView(viewModel: viewModel)
        return view
    }()
    
    lazy var saveButton : UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plant Add"

        configureBind()
    }
    
    override func configureView() {
        navigationController?.navigationBar.isHidden = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(plantSearchView)
        
        stackView.addArrangedSubview(tableView)
        stackView.addArrangedSubview(plantInputView)
        stackView.addArrangedSubview(saveButton)
    }
    override func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.top.equalTo(plantSearchView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        saveButton.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
    }
    
    func configureBind() {
        viewModel.plantsList
            .map { plants in
                if plants.count < 4 {
                return CGFloat(plants.count * 100) // row의 높이로
                }else{
                    return CGFloat(400)
                }
            }
            .bind { [weak self] height in
                self?.tableView.reloadData()
                self?.tableView.snp.updateConstraints { make in
                    make.height.equalTo(height)
                }
            }
            .disposed(by: disposeBag)
    }
    
    @objc func saveButtonTapped() {
        viewModel.saveButtonTapped()
    }
    
    
    
    
}


extension PlantListAddViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do {
            return try viewModel.plantsList.value().count
        } catch {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlantListAddTableCell.reuseIdentifier, for: indexPath) as? PlantListAddTableCell else {
                    return UITableViewCell()
                }
                do {
                    let plant = try viewModel.plantsList.value()[indexPath.row]
                    cell.configure(plant: plant)
                } catch {
                    print("오류")
                }

                return cell
      
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        <#code#>
    //    }
    
}
