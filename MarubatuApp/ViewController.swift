//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 田内　翔太郎 on 2019/08/03.
//  Copyright © 2019 田内　翔太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// クイズの問題を表示
    @IBOutlet weak var questionLabel: UILabel!
    
    /// 現在のクイズ番号を管理
    var currentQuestionNum: Int = 0
    
    /// 問題を管理 (true = マル、 false = バツ）
    let questions: [[String: Any]] = [
        // question = 問題、　answer = 答え
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
    
    /// 問題を表示する関数
    func showQuestion() {
        // currentQuestionNum(問題番号)の問題を取得
        let question = questions[currentQuestionNum]
        
        // 問題（辞書型）からKeyを指定して内容を取得
        if let que = question["question"] as? String {
            // question Key の中身をLabelに代入
            questionLabel.text = que
        }
    }
    
    /// 回答をチェックする関数
    /// 正解なら次の問題を表示します
    func checkAnswer(yourAnswer: Bool) {
        // どの問題か取得する
        let question = questions[currentQuestionNum]
        
        // 問題の答えを取り出す
        if let ans = question["answer"] as? Bool {
            
            // 選択された答えと問題の答えを比較する
            if yourAnswer == ans {
                // 正解
                // currentQuestionNumを1足して次の問題に進む
                currentQuestionNum += 1
                showAlert(message: "正解!")
            } else {
                // 不正解
                showAlert(message: "不正解...")
            }
        } else {
            print("答えが入っていません")
            return
        }
        
        // currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        // 問題を表示します
        // 正解であれば次の問題が、不正解であれば同じ問題が再表示されます
        showQuestion()
    }
    
    /// アラートを表示する関数
    func showAlert(message: String) {
        // アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle:  .alert)
        // アラートのアクション（ボタン部分の定義）
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        // 作成したalertに閉じるボタンを追加
        alert.addAction(close)
        // アラートを表示する
        present(alert, animated: true, completion: nil)
    }

    // バツボタン
    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    // マルボタン
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
}

