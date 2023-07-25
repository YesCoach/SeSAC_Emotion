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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureButton()
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

    func configureButton() {
        emotionButtonCollection.forEach { button in
            guard let emotion = Emotion(rawValue: button.tag),
                  let menu = createButtonMenu(with: emotion)
            else { return }

            button.menu = menu
        }
    }

    func createButtonMenu(with emotion: Emotion) -> UIMenu? {
        guard let _ = data[emotion] else { return nil }
        let action = [
            UIAction(title: "+1", handler: { _ in
                self.data[emotion]! += 1
                print("\(emotion.title) \(self.data[emotion]!)점!!")
            }),
            UIAction(title: "+5", handler: { _ in
                self.data[emotion]! += 5
                print("\(emotion.title) \(self.data[emotion]!)점!!")
            }),
            UIAction(title: "+10", handler: { _ in
                self.data[emotion]! += 10
                print("\(emotion.title) \(self.data[emotion]!)점!!")
            }),
            UIAction(title: "reset", handler: { _ in
                self.data[emotion] = 0
                print("\(emotion.title) \(self.data[emotion]!)점!!")
            })
        ]

        return UIMenu(options: .displayInline, children: action)
    }
}
