//
//  TapNumberViewController.swift
//  TapNamber
//
//  Created by 井戸海里 on 2020/09/22.
//

import UIKit

class TapNumberViewController: UIViewController {
    //各ラベルの宣言
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var tokutenLabel:UILabel!
    @IBOutlet var mondaiLabel:UILabel!
    @IBOutlet var goukeiLabel:UILabel!
    @IBOutlet var timerLabel2:UILabel!
    //ユーザーデフォルトにアクセスする
    var saveData: UserDefaults = UserDefaults.standard
   
    
    //通過した数字を表示する
    var count: Float = 15.00
    //timerの宣言
    var timer: Timer!
    //数字を格納する配列
    var numberArray: [Any] = ["0","1","2","3","4","5","6","7","8"]
    //合計得点を数えるための変数
    var number: Int = 0
    
    var seikaiArray: [String] = ["0","1","2","3","4","5","6","7","8","9"]
    var index: Int = 0
    
    
    
    
    
    
    //ボタンのパーツを決める宣言
    @IBOutlet var numberButton0:UIButton!
    @IBOutlet var numberButton1:UIButton!
    @IBOutlet var numberButton2:UIButton!
    @IBOutlet var numberButton3:UIButton!
    @IBOutlet var numberButton4:UIButton!
    @IBOutlet var numberButton5:UIButton!
    @IBOutlet var numberButton6:UIButton!
    @IBOutlet var numberButton7:UIButton!
    @IBOutlet var numberButton8:UIButton!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマー作ります
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(self.down),
                                     userInfo: nil,
                                     repeats: true)
       shuffle()
        
       
    }
    
    func shuffle(){
        
        
        //ボタンに書いてある数字をシャッフルする
        numberArray.shuffle()
        //シャッフルできているか確認する
        print(numberArray)

        //ボタンに数字をセットして表示する
        numberButton0.setTitle(numberArray[0] as? String, for: .normal)
        numberButton1.setTitle(numberArray[1] as? String, for: .normal)
        numberButton2.setTitle(numberArray[2] as? String, for: .normal)
        numberButton3.setTitle(numberArray[3] as? String, for: .normal)
        numberButton4.setTitle(numberArray[4] as? String, for: .normal)
        numberButton5.setTitle(numberArray[5] as? String, for: .normal)
        numberButton6.setTitle(numberArray[6] as? String, for: .normal)
        numberButton7.setTitle(numberArray[7] as? String, for: .normal)
        numberButton8.setTitle(numberArray[8] as? String, for: .normal)
        
        numberButton0.setTitleColor(UIColor.brown, for: .normal)
        numberButton1.setTitleColor(UIColor.brown, for: .normal)
        numberButton2.setTitleColor(UIColor.brown, for: .normal)
        numberButton3.setTitleColor(UIColor.brown, for: .normal)
        numberButton4.setTitleColor(UIColor.brown, for: .normal)
        numberButton5.setTitleColor(UIColor.brown, for: .normal)
        numberButton6.setTitleColor(UIColor.brown, for: .normal)
        numberButton7.setTitleColor(UIColor.brown, for: .normal)
        numberButton8.setTitleColor(UIColor.brown, for: .normal)
    }
    
    //タイマー関連のメソッド
    @objc func down() {
        //カウントダウンが０より大きかったらそのまま
        if count > 0.0 {
            
            count = count - 0.01
            
            timerLabel2.text = String(format: "%.2f",count)
            
        // 0以下になったら
        }else if count <= 0.0{
            //タイマーを止める
            timer.invalidate()
            //ユーザデフォルトに書き込む
            let number1: Int = saveData.integer(forKey: "first")
            let number2: Int = saveData.integer(forKey: "second")
            let number3: Int = saveData.integer(forKey: "third")

            if  number > number1 {
                saveData.set(number, forKey: "first")
                saveData.set(number1, forKey: "second")
                saveData.set(number2, forKey: "third")
            }else if number > number2 {
                
                saveData.set(number, forKey: "second")
                saveData.set(number2, forKey: "third")
                
            }else if number > number3 {
                
                saveData.set(number, forKey: "third")
            }
            saveData.synchronize()
            //結果画面に遷移するようにする
            performSegueToResult()
        }
        
    }
    //ボタンのメソッド
    @IBAction func tapNumber(sender: UIButton){
     
    
        
        if seikaiArray[index] == sender.currentTitle {
            number = number + 10
            goukeiLabel.text = String(number)
            sender.setTitle("", for: .normal)
           
        }else {
            index = index - 1
        }
        
        index = index + 1
       print(index)
        
        if index > 8{
            
            shuffle()
            
            index = 0
        }
        
    }
    
    //タイムアップしたら自動で結果画面に遷移するようにする
    func performSegueToResult(){
        
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    //セグエを準備する時に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.number = self.number
        }
    }
        
        
        
        
       
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


