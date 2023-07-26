//
//  WriteEmotionViewController.swift
//  SeSAC_Emotion
//
//  Created by 박태현 on 2023/07/25.
//

import UIKit

final class WriteEmotionViewController: UIViewController {

    @IBOutlet var emotionButtonCollection: [UIButton]!

    private let userDefaultsManager = UserDefaultsManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }

    @IBAction func didEmotionButtonTouched(_ sender: UIButton) {
        if let emotion = Emotion(rawValue: sender.tag) {
            saveEmotionData(emotion, count: 1)
        }
    }
}

private extension WriteEmotionViewController {
    func configureButton() {
        emotionButtonCollection.forEach { button in
            guard let emotion = Emotion(rawValue: button.tag),
                  let menu = createButtonMenu(with: emotion)
            else { return }

            button.menu = menu
        }
    }

    func createButtonMenu(with emotion: Emotion) -> UIMenu? {
        // Closure 내에서 self 캡처시 WriteEmotionViewController의 Reference Count가 올라감
        let actions = [
            UIAction(title: "+1", handler: { [weak self] _ in
                self?.saveEmotionData(emotion, count: 1)
            }),
            UIAction(title: "+5", handler: { [weak self] _ in
                self?.saveEmotionData(emotion, count: 5)
            }),
            UIAction(title: "+10", handler: { [weak self] _ in
                self?.saveEmotionData(emotion, count: 10)
            }),
            UIAction(title: "reset", handler: { [weak self] _ in
                self?.saveEmotionData(emotion, isReset: true)
            })
        ]

        return UIMenu(options: .displayInline, children: actions)
    }

    func saveEmotionData(_ emotion: Emotion, count: Int = 0, isReset: Bool = false) {
        if isReset {
            userDefaultsManager.resetEmotionData(emotion)
        } else {
            userDefaultsManager.saveEmotionData(emotion, count: count)
        }
        print("\(emotion.title) \(userDefaultsManager.loadEmotionData(emotion))점!!")
    }
}
