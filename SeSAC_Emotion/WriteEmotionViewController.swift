//
//  WriteEmotionViewController.swift
//  SeSAC_Emotion
//
//  Created by 박태현 on 2023/07/25.
//

import UIKit

final class WriteEmotionViewController: UIViewController {

    @IBOutlet var emotionButtonCollection: [UIButton]!

    private var data: [Emotion: Int] = [:]
    private var upCount = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureButtonMenu()
    }

    @IBAction func didEmotionButtonTouched(_ sender: UIButton) {
        if let emotion = Emotion(rawValue: sender.tag),
           let count = data[emotion] {
            data[emotion] = count + upCount
            print("\(emotion.title) \(count + upCount)점!!")
        }
    }
}

private extension WriteEmotionViewController {
    func configureData() {
        Emotion.allCases.forEach {
            data[$0] = 0
        }
    }

    func configureButtonMenu() {
        let action = [
            UIAction(title: "+1", handler: { _ in self.upCount = 1 }),
            UIAction(title: "+5", handler: { _ in self.upCount = 5 }),
            UIAction(title: "+10", handler: { _ in self.upCount = 10 })
        ]
        emotionButtonCollection.forEach {
            $0.menu = UIMenu(
                options: .displayInline,
                children: action
            )
        }
    }
}
