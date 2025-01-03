//
//  OnboardingViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import SnapKit

final class OnboardingViewController: BaseViewController {
    var viewModel: OnboardingViewModel!
    var onComplete: () -> Void
    
    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.clipsToBounds = true
        return view
    }()
    var pageViews: [UIImageView] = []
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        if let nextImage = UIImage(systemName: "arrow.right.circle.fill")?.resized(to: CGSize(width: 50, height: 50)) {
            button.setImage(nextImage, for: .normal)
        }
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var previousButton: UIButton = {
        let button = UIButton(type: .system)
        if let previousImage = UIImage(systemName: "arrow.left.circle.fill")?.resized(to: CGSize(width: 50, height: 50)) {
            button.setImage(previousImage, for: .normal)
        }
        button.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("완료", for: .normal)
        button.backgroundColor = ColorChart.primary
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    init(viewModel: OnboardingViewModel, onComplete: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onComplete = onComplete
        super.init(nibName: nil, bundle: nil)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorChart.background
        scrollView.delegate = self
        setupPages()
        viewModel.updateButtonColors(nextButton: nextButton, previousButton: previousButton)
    }
    override func configureView(){
        view.addSubview(scrollView)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        view.addSubview(skipButton)
        
    }
    override func setConstraints(){
        scrollView.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide)
        }
        nextButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalTo(view)
        }
        
        previousButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(view)
        }
        skipButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-80)
        }
    }
    // 스크롤 뷰 셋팅
    private func setupPages() {
        for i in 0..<viewModel.Onboardinglist.count {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            if let image = UIImage(named: viewModel.Onboardinglist[i]) {
                imageView.image = image
            }
            scrollView.addSubview(imageView)
            pageViews.append(imageView)
            
            imageView.snp.makeConstraints { make in
                make.top.bottom.equalTo(view.safeAreaLayoutGuide)
                make.width.equalTo(view.frame.width)
                make.left.equalTo(view.frame.width * CGFloat(i))
            }
        }
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(viewModel.Onboardinglist.count), height: view.frame.height)
    }
    
    // 버튼 이벤트
    @objc private func nextButtonTapped() {
        viewModel.scrollToNextPage(scrollView: scrollView)
        viewModel.updateButtonColors(nextButton: nextButton, previousButton: previousButton)
    }
    
    @objc private func previousButtonTapped() {
        viewModel.scrollToPreviousPage(scrollView: scrollView)
        viewModel.updateButtonColors(nextButton: nextButton, previousButton: previousButton)
    }
    
    @objc private func skipButtonTapped() {
        onComplete()
    }
}

extension OnboardingViewController :UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        viewModel.updatePageIndex(for: scrollView)
        viewModel.updateButtonColors(nextButton: nextButton, previousButton: previousButton)
    }
}
