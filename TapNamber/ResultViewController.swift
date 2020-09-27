//
//  ResultViewController.swift
//  TapNamber
//
//  Created by 井戸海里 on 2020/09/22.
//

import UIKit

class ResultViewController: UIViewController {
    //得点を数えるための変数
    var number: Int = 0
    //結果のラベルの宣言
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //データを受け取って表示する
        resultLabel.text = String(number)

        // Do any additional setup after loading the view.
    }
    //閉じるボタンを押した時のメソッド
    @IBAction func back(){
        
        //コードで書くことで一度に二画面戻ることができる
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
