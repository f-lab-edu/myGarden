//
//  firebasePlant.swift
//  myGarden
//
//  Created by zeze kim on 1/16/25.
//
import FirebaseFirestore

//let db = Firestore.firestore()

func fetchPlantsByKeyword() {
    let keyword = "율마"
    db.collection("plants")
        .whereField("distbNm", arrayContains: keyword)
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
                print("Fetched plants: \(plants.count)")
            }
        }

}
















//import Foundation
//
//let apiKey = "인증키"
//
//func fetchPlantData(plantname: String) {
//    let parameter = "?apiKey=\(apiKey)&sText=\(plantname)"
//    let urlString = "http://api.nongsaro.go.kr/service/garden/gardenList" + parameter // 심플
////    let urlString = "http://api.nongsaro.go.kr/service/garden/gardenDtl" + parameter // 상세
//    
//    guard let url = URL(string: urlString) else {
//        print("잘못된 URL: \(urlString)")
//        return
//    }
//    
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        if let error = error {
//            print("에러 발생: \(error.localizedDescription)")
//            return
//        }
//        
//        guard let data = data else {
//            print("데이터가 없습니다.")
//            return
//        }
//        
//        // JSONDecoder를 사용해 응답 데이터를 디코딩
//        let decoder = JSONDecoder()
//        
//        do {
//            // 데이터를 'Plant' 모델 객체로 디코딩
//            let plantResponse = try decoder.decode([Plant].self, from: data)
//            for plant in plantResponse {
//                print("이름: \(String(describing:plant.plntbneNm)), 설명: \(String(describing: plant.adviseInfo))")
//            }
//        } catch {
//            print("디코딩 에러: \(error.localizedDescription)")
//        }
//    }
//    
//    task.resume()
//}
