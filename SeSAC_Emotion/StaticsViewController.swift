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

    private let userDefaultsManager = UserDefaultsManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                let count = userDefaultsManager.loadEmotionData(emotion)
                $0.text = "\(count)점"
            }
        }
    }
}
