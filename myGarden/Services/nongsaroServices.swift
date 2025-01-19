//
//  nongsaroServices.swift
//  myGarden
//
//  Created by zeze kim on 1/17/25.
//
import Foundation

// PlantcntntsNo 모델
struct PlantcntntsNo {
    var cntntsNo: String
}
// cntntsNo리스트를 받아 오기 위한
class PlantNumXMLParserHandler: NSObject, XMLParserDelegate {
    var currentElement = ""
    var currentCntntsNo: String = ""
    var plants: [PlantcntntsNo] = []
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String] = [:]) {
        currentElement = elementName
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElement == "cntntsNo" {
            currentCntntsNo += string.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let plant = PlantcntntsNo(cntntsNo: currentCntntsNo)
            plants.append(plant)
            currentCntntsNo = ""
        }
    }
}

func fetchCntntsNoAndSjList() {

    let apiKey = Bundle.main.NONGSARO_API_KEY
    
    guard let url = URL(string: "http://api.nongsaro.go.kr/service/garden/gardenList?apiKey=\(apiKey)&numOfRows=5&pageNo=6") else {
        print("잘못된 URL입니다.")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("API 호출 실패: \(error.localizedDescription)")
            return
        }
        
        guard let data = data else {
            print("응답 데이터가 없습니다.")
            return
        }
        
        let xmlParser = XMLParser(data: data)
        let delegate = PlantNumXMLParserHandler()
        xmlParser.delegate = delegate
        
        if xmlParser.parse() {
            print("XML 파싱 성공")
            // 추출된 cntntsNo와 cntntsSj 리스트 출력
            for plant in delegate.plants {
                print("cntntsNo: \(plant.cntntsNo)")
            }
        } else {
            print("XML 파싱 실패")
        }
    }
    
    // 태스크 실행
    task.resume()
}
///cntntsNo: 12938, cntntsSj: 가울테리아
//cntntsNo: 12954, cntntsSj: 개운죽
//cntntsNo: 12955, cntntsSj: 골드크레스트 '윌마'
//cntntsNo: 12957, cntntsSj: 공작야자
//cntntsNo: 12962, cntntsSj: 관엽베고니아
//cntntsNo: 13249, cntntsSj: 필로덴드론 콩고
//cntntsNo: 12987, cntntsSj: 해마리아
//cntntsNo: 12983, cntntsSj: 행운목
//cntntsNo: 12981, cntntsSj: 헤미오니티스(하트펀)
//cntntsNo: 12979, cntntsSj: 헤테로파낙스 프라그란스 (해피트리)
//cntntsNo: 12978, cntntsSj: 협죽도
//cntntsNo: 12976, cntntsSj: 형광스킨답서스
//cntntsNo: 12986, cntntsSj: 호야
//cntntsNo: 12975, cntntsSj: 호야 엑소티카
//cntntsNo: 12973, cntntsSj: 호주매
//cntntsNo: 12971, cntntsSj: 홀리아페페로미아
//cntntsNo: 12937, cntntsSj: 황금마삭줄
//cntntsNo: 12932, cntntsSj: 황금죽
//cntntsNo: 12956, cntntsSj: 후피향나무
//cntntsNo: 12920, cntntsSj: 흰꽃나도사프란
//cntntsNo: 12919, cntntsSj: 흰줄무늬달개비(트라데스칸티아)
//cntntsNo: 12901, cntntsSj: 히포에스테스



//cntntsNo 를 가지고 상세 디테일을 가져오는 것
class PlantDetailXMLParserHandler: NSObject, XMLParserDelegate {
    var plants: [Plant] = []
    var currentElement: String = ""
    var currentPlant: Plant?
    
    // 태그의 내용 처리
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "cntntsNo":
            currentPlant?.cntntsNo = string
        case "plntbneNm":
            currentPlant?.plntbneNm = string
        case "plntzrNm":
            currentPlant?.plntzrNm = string
        case "distbNm":
            currentPlant?.distbNm?.append(string) // 유통 명은 배열로 처리
        case "fmlNm":
            currentPlant?.fmlNm = string
        case "orgplceInfo":
            currentPlant?.orgplceInfo = string
        case "adviseInfo":
            currentPlant?.adviseInfo = string
        case "imageEvlLinkCours":
            currentPlant?.imageEvlLinkCours = string
        case "smellCode":
            currentPlant?.smellCode = string
        case "prpgtEraInfo":
            currentPlant?.prpgtEraInfo = string
        case "managelevelCodeNm":
            currentPlant?.managelevelCodeNm = string
        case "grwtveCodeNm":
            currentPlant?.grwtveCodeNm = string
        case "grwhTpCodeNm":
            currentPlant?.grwhTpCodeNm = string
        case "winterLwetTpCodeNm":
            currentPlant?.winterLwetTpCodeNm = string
        case "hdCodeNm":
            currentPlant?.hdCodeNm = string
        case "watercycleSprngCodeNm":
            currentPlant?.watercycleSprngCodeNm = string
        case "watercycleSummerCodeNm":
            currentPlant?.watercycleSummerCodeNm = string
        case "watercycleAutumnCodeNm":
            currentPlant?.watercycleAutumnCodeNm = string
        case "watercycleWinterCodeNm":
            currentPlant?.watercycleWinterCodeNm = string
        case "speclmanageInfo":
            currentPlant?.speclmanageInfo = string
        case "fncltyInfo":
            currentPlant?.fncltyInfo = string
        case "managedemanddoCodeNm":
            currentPlant?.managedemanddoCodeNm = string
        case "clCodeNm":
            currentPlant?.clCodeNm = string
        case "grwhstleCodeNm":
            currentPlant?.grwhstleCodeNm = string
        case "flclrCodeNm":
            currentPlant?.flclrCodeNm = string
        case "lighttdemanddoCodeNm":
            currentPlant?.lighttdemanddoCodeNm = string
        case "postngplaceCodeNm":
            currentPlant?.postngplaceCodeNm = string
        default:
            break
        }
    }
    
    // 태그 시작 시 호출
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if elementName == "item" {
            currentPlant = Plant()  // 새 식물 객체 생성
        }
    }
    
    // 태그 끝날 때 호출
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item", let plant = currentPlant {
            plants.append(plant)  // 새로운 식물 객체를 배열에 추가
        }
    }
}

func fetchData() {
    let apiKey = Bundle.main.NONGSARO_API_KEY
    let cntntsNo = "12939"  // 원하는 식물의 cntntsNo로 교체
    // cntntsNo 리스트: ["12938", "12954", "12955", "12957", "12962", "12963", "12966", "12972", "12974", "12988"]
    let parameter = "/garden/gardenDtl?apiKey=\(apiKey)&cntntsNo=\(cntntsNo)"
    
    guard let url = URL(string: "http://api.nongsaro.go.kr/service" + parameter) else {
        print("잘못된 URL")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("API 호출 실패: \(error.localizedDescription)")
            return
        }
        
        guard let data = data else {
            print("받은 데이터가 없음")
            return
        }
        
        // 받은 데이터를 문자열로 출력 (디버깅용)
        if let dataString = String(data: data, encoding: .utf8) {
            print("받은 데이터: \(dataString)")
        }
        
        // XML 파싱
        let xmlParser = XMLParser(data: data)
        let delegate = PlantDetailXMLParserHandler()
        xmlParser.delegate = delegate
        
        if xmlParser.parse() {
            // 파싱된 결과 출력
            for plant in delegate.plants {
                print("\(String(describing: plant.plntbneNm))")
            }
        } else {
            print("XML 파싱 실패")
        }
    }
    
    task.resume()
}



