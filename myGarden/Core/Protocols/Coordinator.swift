//
//  Coordinator.swift
//  MyGarden
//
//  Created by zeze kim on 12/30/24.
//

import SwiftUI

protocol Coordinator  {
    func start() // Coordinator를 생성하고 해당 함수를 호출
    func finish() // 해당 Coordinator가 끝나면 호출.

}
