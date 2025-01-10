//
//  OnboardingViewController.swift
//  MyGarden
//
//  Created by zeze kim on 1/1/25.
//
import UIKit
import SnapKit
import RxSwift

final class OnboardingViewController: BaseViewController {
    var viewModel : OnboardingViewModel?
    let disposeBag = DisposeBag()
    
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
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = ColorChart.primary
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorChart.background
        scrollView.delegate = self
        onboardingObserverBind()
        
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
    
    //Observer 바인딩 부분
    func onboardingObserverBind() {
        viewModel?.onboardingList
            .bind { [weak self] imageNames in
                self?.setupPages(imageNames: imageNames)
            }
            .disposed(by: disposeBag)
        viewModel?.currentPage
            .subscribe(onNext: { [weak self] page in
                self?.updateButton(currentPage: page)
            })
            .disposed(by: disposeBag)
    }
    
    // 버튼을 업데이트 하는 부분
    func updateButton(currentPage: Int) {
        let isLastPage = currentPage == viewModel!.onboardingListCount - 1
        let skipButtonColor = isLastPage ? ColorChart.accent : ColorChart.primary
        let nextButtonColor = isLastPage ? ColorChart.submit : ColorChart.primary
        let previousButtonColor = currentPage == 0 ? ColorChart.primaryAsh : ColorChart.primary
        
        // 색상 업데이트
        skipButton.backgroundColor = skipButtonColor
        nextButton.tintColor = nextButtonColor
        previousButton.tintColor = previousButtonColor
        
        // 이미지 업데이트
        let nextImage: UIImage?
        if isLastPage {
            nextImage = UIImage(systemName: "checkmark.circle.fill")?.resized(to: CGSize(width: 50, height: 50))
        } else {
            nextImage = UIImage(systemName: "arrow.right.circle.fill")?.resized(to: CGSize(width: 50, height: 50))
        }
        nextButton.setImage(nextImage, for: .normal)
    }
    
    // 페이지 셋팅
    func setupPages(imageNames: [String]) {
        for (i, imageName) in imageNames.enumerated() {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            if let image = UIImage(named: imageName) {
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
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(imageNames.count), height: view.frame.height)
    }
    
    
    @objc private func nextButtonTapped() {
        viewModel?.scrollToNextPage()
        updateScrollViewPosition()
    }
    
    @objc private func previousButtonTapped() {
        viewModel?.scrollToPreviousPage()
        updateScrollViewPosition()
    }
    
    @objc private func skipButtonTapped() {
        viewModel?.completeOnboarding()
    }
    
    func updateScrollViewPosition() {
        let offsetX = CGFloat((viewModel?._currentPage.value)!) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

extension OnboardingViewController :UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        viewModel?.updateCurrentPage(page)
    }
}
