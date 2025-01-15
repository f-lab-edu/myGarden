//
//  PlantModel.swift
//  myGarden
//
//  Created by zeze kim on 1/16/25.
//
import Foundation

struct Plant: Codable {
    var cntntsNo: String?    // 관리 번호
    var plntbneNm: String?   // 식물 학명
    var plntzrNm: String?    // 식물 영명
    var distbNm: [String?]     // 유통 명
    var fmlNm: String?       // 과명
    var orgplceInfo: String? // 원산지 명
    var adviseInfo: String?  // 조언 정보
    var imageEvlLinkCours: String? // 이미지 평가 링크
    var smellCode: String? // 냄새 코드
    var prpgtEraInfo: String? // 번식 시기
    var managelevelCodeNm: String? // 관리수준 코드
    var grwtveCodeNm: String? // 생장속도 코드
    var grwhTpCodeNm: String? // 생육 온도 코드
    var winterLwetTpCodeNm: String? // 겨울 최저 온도 코드
    var hdCodeNm: String? // 습도 코드
    var watercycleSprngCodeNm: String? // 물주기 봄 코드
    var watercycleSummerCodeNm: String? // 물주기 여름 코드
    var watercycleAutumnCodeNm: String? // 물주기 가을 코드
    var watercycleWinterCodeNm: String? // 물주기 겨울 코드
    var speclmanageInfo: String? // 특별관리 정보
    var fncltyInfo: String? // 기능성 정보
    var managedemanddoCodeNm: String? // 관리요구도 코드
    var clCodeNm : String? // 분류 코드
    var grwhstleCodeNm : String? // 생육 코드
    var flclrCodeNm : String? // 꽃 잎 색상
    var lighttdemanddoCodeNm : String? // 광도 요구
    var postngplaceCodeNm : String? // 배치장소
}
