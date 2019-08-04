//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 田内　翔太郎 on 2019/08/03.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // クイズの問題を表示
    @IBOutlet weak var questionLabel: UILabel!
    
    // 現在のクイズ番号を管理
    var currentQuestionNum: Int = 0
    
    // 問題を管理 (true = マル、 false = バツ）
    let questions: [[String: Any]] = [
        [ "question": "iPhoneアプリを開発する統合環境はZcodeである",
          "answer": false
        ],
        [ "question": "Xcode画面の右側にはユーティリティーズがある",
          "answer": true
        ],
        [ "question": "UILabelは文字列を表示する際に利用する",
          "answer": true
        ],
        [ "question": "ドラえもんは常に地面から浮いている",
          "answer": true
        ],
        [ "question": "「あ」の次は「う」である",
          "answer": false
        ],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        showQuestion()
    }
    
    // 問題を表示する関数
    func showQuestion() {
        // currentQuestionNum(問題番号)の問題を取得
        let question = questions[currentQuestionNum]
        
        // 問題（辞書型）からKeyを指定して内容を取得
        if let que = question["question"] as? String {
            // question Key の中身をLabelに代入
            questionLabel.text = que
        }
    }

    // バツボタン
    @IBAction func tappedNoButton(_ sender: UIButton) {
    }
    
    // マルボタン
    @IBAction func tappedYesButton(_ sender: UIButton) {
    }
    
    
}

