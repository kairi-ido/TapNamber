//
//  RankingViewController.swift
//  TapNamber
//
//  Created by 井戸海里 on 2020/09/22.
//

import UIKit

class RankingViewController: UIViewController {
    //ユーザデフォルトにアクセスする
    var saveData: UserDefaults = UserDefaults.standard
    
    //合計得点を数えるための変数
    var number: Int = 0
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    //合計得点のラベルの宣言
    @IBOutlet var goukeiLabel1:UILabel!
    @IBOutlet var goukeiLabel2:UILabel!
    @IBOutlet var goukeiLabel3:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
            //データの読み込み
            number = saveData.object(forKey: "save1") as! Int
          
            //1位として保存("firstというキーで「number」という値を保存する）"
            saveData.set(number, forKey: "first")
            //1位のデータを読み込む
            number1 = saveData.object(forKey: "first") as! Int
            //1位を表示する
            goukeiLabel1.text = String(number1)
        
        
        
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
