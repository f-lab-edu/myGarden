//
//  View.swift
//  MyForest
//
//  Created by zeze kim on 12/28/24.
//

import SwiftUI

struct OnboardingView: View {

    @ObservedObject var viewModel: OnboardingViewModel
    var onComplete: () -> Void // 클로저 변수 추가
    var body: some View {
        ZStack {
            Color(ColorChart.background).edgesIgnoringSafeArea(.all)
            TabView(selection: $viewModel.currentPage) {
                ForEach(0..<viewModel.Onboardinglist.count, id: \.self) { index in
                    Image(viewModel.Onboardinglist[index].imageName)
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        viewModel.moveToPreviousPage()
                    }) {
                        Text("<")
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 60, height: 60)
                            .background(viewModel.currentPage == 0 ? Color(ColorChart.primaryAsh) : Color(ColorChart.primary))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                    .disabled(viewModel.currentPage == 0)
                    
                    Spacer()
                    
                    Button(action: {
                        if viewModel.currentPage == viewModel.Onboardinglist.count - 1 {
                            onComplete()
                        } else {
                            viewModel.moveToNextPage()
                        }
                    }) {
                        Text( viewModel.currentPage == viewModel.Onboardinglist.count - 1 ? "완료" : ">")
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: viewModel.currentPage == viewModel.Onboardinglist.count - 1 ? 70 : 60, height: 60)
                            .background(viewModel.currentPage == viewModel.Onboardinglist.count - 1 ? Color(ColorChart.submit) : Color(ColorChart.primary))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                    }
                   
                } .frame(width: UIScreen.main.bounds.width * 0.9) // 화면 너비의 80%로 설정
                Spacer()
                Button(action: onComplete) {
                    Text("시작하기")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(ColorChart.success))
                        .cornerRadius(10)
                }.padding(.bottom, 60)
            }
        }}
}

//#Preview {
//    OnboardingView(viewModel:OnboardingViewModel())
//    
//}
