//
//  PlantListAddViewModel.swift
//  myGarden
//
//  Created by zeze kim on 1/19/25.
//

import UIKit
import FirebaseFirestore
import RxSwift
import RxCocoa

final class PlantListAddViewModel {
    private let db = Firestore.firestore()
    let disposeBag = DisposeBag()
    // 키워드 뷰모델에서 관리
    // rx로 저장 키워드들을 보낸다
    // 키워드를 search로 전달해서 파이어베이스에서 검색
    // 검색해서 나온 결과들을 tablevie에 전달
    // 검색 키워드
    let plantKeyword = BehaviorRelay<String>(value: "") // 루스커스 ,몬스테라 
    
    private let plantsSubject = BehaviorSubject<[Plant]>(value: [])
    
    var plants: Observable<[Plant]> {
        return plantsSubject.asObservable()
    }
    
    func updatePlants(_ plants: [Plant]) {
        plantsSubject.onNext(plants)
    }
    
    func dateChanged(picker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "ko_KR")
        let formattedDate = formatter.string(from: picker.date)
        print("날짜 \(formattedDate)")
        
    }
    func saveButtonTapped() {
        print("저장 버튼 클릭")
        Firestore.firestore().collection("plants").getDocuments { snapshot, error in
            if let error = error {
                print("Firestore fetch error: \(error.localizedDescription)")
            } else {
                print("Fetched plants: \(snapshot?.documents.count ?? 0)")
            }
        }
    }
    
    func searchButtonTapped() {
        guard !plantKeyword.value.isEmpty else { return }
        fetchPlantsByKeyword()
        print("Fetched plants: \(plants)")
    }
    
    private func fetchPlantsByKeyword(){
        db.collection("plants")
            .whereField("distbNm", isEqualTo: plantKeyword.value)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error.localizedDescription)")
                } else {
                    var plants: [Plant] = []
                    for document in querySnapshot!.documents {
                        do {
                            let plant = try document.data(as: Plant.self)
                            plants.append(plant)
                        } catch {
                            print("Error decoding document: \(error)")
                        }
                    }
                    self.updatePlants(plants)
                }
            }
    }
    
}
