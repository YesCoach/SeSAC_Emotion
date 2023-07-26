//
//  UserDefaultsManager.swift
//  SeSAC_Emotion
//
//  Created by 박태현 on 2023/07/26.
//

import Foundation

final class UserDefaultsManager {

    static var shared = UserDefaultsManager()

    private let standard = UserDefaults.standard

    private init() {}
}

extension UserDefaultsManager {
    func saveEmotionData(_ emotion: Emotion, count: Int) {
        let value = standard.integer(forKey: emotion.userDefaultsKey)
        standard.setValue(value + count , forKey: emotion.userDefaultsKey)
    }

    func resetEmotionData(_ emotion: Emotion) {
        standard.setValue(0, forKey: emotion.userDefaultsKey)
    }

    func loadEmotionData(_ emotion: Emotion) -> Int {
        return standard.integer(forKey: emotion.userDefaultsKey)
    }
}
