//
//  StaticsViewController.swift
//  SeSAC_Emotion
//
//  Created by 박태현 on 2023/07/25.
//

import UIKit

final class StaticsViewController: UIViewController {

    @IBOutlet var moodViewCollection: [UIView]!
    @IBOutlet var emotionCountLabelCollection: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureData()
    }
}

private extension StaticsViewController {
    func configureUI() {
        moodViewCollection.forEach {
            $0.layer.cornerRadius = 10.0
        }
    }

    func configureData() {
        emotionCountLabelCollection.forEach {
            if let emotion = Emotion(rawValue: $0.tag) {
                let count = UserDefaultsManager.shared.loadEmotionData(emotion)
                $0.text = "\(count)점"
            }
        }
    }
}
