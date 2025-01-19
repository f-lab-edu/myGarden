//
//  firebasePlantServices.swift
//  myGarden
//
//  Created by zeze kim on 1/16/25.
//
import FirebaseFirestore

let db = Firestore.firestore()

// 파이어스토어에서 찾아오기 (임시)
func fetchPlantsByKeyword(_ keyword: String) {
    let keyword = "율마"
    db.collection("plants")
        .whereField("distbNm", isEqualTo: keyword)
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
func savePlantToFirestore(plant : Plant, urlString : String) {
    do {
        var data = plant
        data.rtnThumbFileUrl = urlString
        let encoder = JSONEncoder()
        let plantData = try encoder.encode(data)
        if let plantDict = try JSONSerialization.jsonObject(with: plantData, options: []) as? [String: Any] {
            db.collection("plants").document(plant.cntntsNo!).setData(plantDict) { error in
                if let error = error {
                    print("Error adding document: \(error.localizedDescription)")
                } else {
                    print("Document successfully added!")
                }
            }
        }
    } catch {
        print("Error encoding plant data: \(error.localizedDescription)")
    }
}
