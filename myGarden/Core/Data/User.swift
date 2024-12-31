//
//  User.swift
//  myGarden
//
//  Created by zeze kim on 1/1/25.
//

import UIKit
import CoreData

func fetchFirstTime() -> Bool? {
    let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
    
    do {
        let result = try context.fetch(fetchRequest)
        
        // 첫 번째 UserData 객체에서 firstTime 값을 가져옴
        if let userData = result.first {
            return userData.firstTime
        }
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
    
    // 데이터가 없거나 오류가 발생했을 경우 nil 반환
    return nil
}

func saveUserData(firstTime: Bool) {
    let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    let entity = NSEntityDescription.entity(forEntityName: "UserData", in: context)!
    let userData = NSManagedObject(entity: entity, insertInto: context)
    
    // firstTime 값 설정
    userData.setValue(firstTime, forKey: "firstTime")
    
    // 저장
    do {
        try context.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}
