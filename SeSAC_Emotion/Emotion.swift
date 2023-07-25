//
//  Emotion.swift
//  SeSAC_Emotion
//
//  Created by 박태현 on 2023/07/25.
//

import Foundation

enum Emotion: Int, CaseIterable {
    case veryHappy
    case happy
    case soso
    case sad
    case verySad
}

extension Emotion {
    var title: String {
        switch self {
        case .veryHappy: return "완전행복지수"
        case .happy: return "적당미소지수"
        case .soso: return "그냥그냥지수"
        case .sad: return "좀속상한지수"
        case .verySad: return "많이슬픈지수"
        }
    }
}
