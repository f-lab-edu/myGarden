//
//  myGarden++Bundle.swift
//  myGarden
//
//  Created by zeze kim on 1/18/25.
//

import Foundation

extension Bundle {
    var NONGSARO_API_KEY : String {
        
        guard let file = self.path(forResource: "OpenApiKeys", ofType: "plist") else {return ""}
        
        guard let resource = NSDictionary(contentsOfFile: file) else {return ""}
        
        guard let key = resource["NONGSARO_API_KEY"] as? String else {
            fatalError("NONGSARO_API_KEY을 찾을수 없음")
        }
        
        return key
    }
    
}
