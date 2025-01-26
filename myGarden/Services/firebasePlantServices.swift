//
//  firebasePlantServices.swift
//  myGarden
//
//  Created by zeze kim on 1/16/25.
//
import FirebaseFirestore

let db = Firestore.firestore()

// 파이어스토어에서 찾아오기 (임시)
//func fetchPlantsByKeyword() {
//    let keyword = "율마"
//    db.collection("plants")
//        .whereField("distbNm", arrayContains: keyword)
//        .getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error getting documents: \(error.localizedDescription)")
//            } else {
//                var plants: [Plant] = []
//                for document in querySnapshot!.documents {
//                    do {
//                        let plant = try document.data(as: Plant.self)
//                        plants.append(plant)
//                    } catch {
//                        print("Error decoding document: \(error)")
//                    }
//                }
//                print("Fetched plants: \(plants.count)")
//            }
//        }
//
//}
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

//// 예시 데이터
//let plant = Plant(
//    cntntsNo: "11111",  // 문서 ID로 사용할 cntntsNo
//    plntbneNm: "Cupressus macrocarpa 'Wilma'",
//    plntzrNm: "Monterey cypress",
//    distbNm: ["율마","골드크리스터"],
//    fmlNm: "측백나무과",
//    orgplceInfo: "북부 아메리카",
//    adviseInfo: "부드러운 연두빛의 침엽수를 연상하게 하는 실내식물로 허브 향을 지님",
//    imageEvlLinkCours: "http://example.com/image",
//    smellCode: "강함",
//    prpgtEraInfo: "",
//    managelevelCodeNm: "경험자",
//    grwtveCodeNm: "보통",
//    grwhTpCodeNm: "16~20℃",
//    winterLwetTpCodeNm: "10℃",
//    hdCodeNm: "40 ~ 70%",
//    watercycleSprngCodeNm: "토양 표면이 말랐을때 충분히 관수함",
//    watercycleSummerCodeNm: "토양 표면이 말랐을때 충분히 관수함",
//    watercycleAutumnCodeNm: "토양 표면이 말랐을때 충분히 관수함",
//    watercycleWinterCodeNm: "화분 흙 대부분 말랐을때 충분히 관수함",
//    speclmanageInfo: "겨울에는 건조하게 관리한다. 어린 나무일수록 물을 더 자주 준다",
//    fncltyInfo: "우리가 사용하고 있는 율마라는 이름은 wilma에서 나온 것으로 생각된다. 따라서 율마라는 이름이 윌마로 교정되어야하지 않을까 고려된다.바람에 약하며 줄기 아랫부분의 잎이 떨어지면 황량한 느낌을 주지만 토피아리 형식으로 키울 수도 있다.크리스마스 트리로 실내에 장식하면 좋다.",
//    managedemanddoCodeNm: "보통 (약간 잘 견딤)",
//    clCodeNm: "잎보기식물",
//    grwhstleCodeNm : "직립형",
//    lighttdemanddoCodeNm : "높은 광도(1,500~10,000 Lux)",
//    postngplaceCodeNm : "거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm),발코니 창측 (실내깊이 0~50cm)"
//)
// 예시 데이터
//let plant = Plant(
//    cntntsNo: "44444",  // 문서 ID로 사용할 cntntsNo
//    plntbneNm: "2Dracaena sanderiana 'Celes'",
//    plntzrNm: "2Dracaena sanderiana 'Celes'",
//    distbNm: ["세레스","드라세나"], // 나중에 둘다 넣기
//    fmlNm: "2백합과",
//    orgplceInfo: "2아프리카",
//    adviseInfo: "",
//    imageEvlLinkCours: "",
//    smellCode: "약함",
//    prpgtEraInfo: "",
//    managelevelCodeNm: "초보자",
//    grwtveCodeNm: "보통",
//    grwhTpCodeNm: "16~20℃",
//    winterLwetTpCodeNm: "13℃ 이상",
//    hdCodeNm: "40 ~ 70%",
//    watercycleSprngCodeNm: "흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)",
//    watercycleSummerCodeNm: "흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)",
//    watercycleAutumnCodeNm: "흙을 촉촉하게 유지함(물에 잠기지 않도록 주의)",
//    watercycleWinterCodeNm: "토양 표면이 말랐을때 충분히 관수함",
//    speclmanageInfo: "",
//    fncltyInfo: "",
//    managedemanddoCodeNm: "보통 (약간 잘 견딤)",
//    clCodeNm: "잎보기식물",
//    grwhstleCodeNm : "직립형, 관목형",
//    lighttdemanddoCodeNm : "낮은 광도(300~800 Lux),중간 광도(800~1,500 Lux),높은 광도(1,500~10,000 Lux)",
//    postngplaceCodeNm : "실내 어두운 곳 (실내깊이 500 이상cm),거실 내측 (실내깊이 300~500cm),거실 창측 (실내깊이 150~300cm),발코니 내측 (실내깊이 50~150cm)"
//)

// 데이터 저장
//savePlantToFirestore(plant: plant)

