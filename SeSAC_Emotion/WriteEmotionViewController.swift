//
//  WriteEmotionViewController.swift
//  SeSAC_Emotion
//
//  Created by 박태현 on 2023/07/25.
//

import UIKit

final class WriteEmotionViewController: UIViewController {

    private var data: [Emotion: Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
    }

    @IBAction func didEmotionButtonTouched(_ sender: UIButton) {
        if let emotion = Emotion(rawValue: sender.tag),
           let count = data[emotion] {
            data[emotion] = count + 1
            print("\(emotion.title) \(count + 1)점!!")
        }
    }
}

private extension WriteEmotionViewController {
    func configureData() {
        Emotion.allCases.forEach {
            data[$0] = 0
        }
    }
}
