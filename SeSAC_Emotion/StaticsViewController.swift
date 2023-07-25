//
//  StaticsViewController.swift
//  SeSAC_Emotion
//
//  Created by 박태현 on 2023/07/25.
//

import UIKit

final class StaticsViewController: UIViewController {

    @IBOutlet var moodViewCollection: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

private extension StaticsViewController {
    func configureUI() {
        moodViewCollection.forEach {
            $0.layer.cornerRadius = 10.0
        }
    }
}
