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
            
        goukeiLabel1.text = String(saveData.integer(forKey: "first"))
        goukeiLabel2.text = String(saveData.integer(forKey: "second"))
        goukeiLabel3.text = String(saveData.integer(forKey: "third"))
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
