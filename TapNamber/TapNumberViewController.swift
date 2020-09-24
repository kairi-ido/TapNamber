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
    
    //通過した数字を表示する
    var count: Float = 15.00
    //timerの宣言
    var timer: Timer!
    //数字を格納する配列
    
    //合計得点を数えるための変数
    var number:Int = 0
    
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
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(self.down),
                                     userInfo: nil,
                                     repeats: true)
        
        var numberArray: [String] = ["0","1","2","3","4","5","6","7","8"]
        
        numberArray.shuffle()
        
        print(numberArray)
        
        numberButton0.setTitle(numberArray[0], for: .normal)
        numberButton1.setTitle(numberArray[1], for: .normal)
        numberButton2.setTitle(numberArray[2], for: .normal)
        numberButton3.setTitle(numberArray[3], for: .normal)
        numberButton4.setTitle(numberArray[4], for: .normal)
        numberButton5.setTitle(numberArray[5], for: .normal)
        numberButton6.setTitle(numberArray[6], for: .normal)
        numberButton7.setTitle(numberArray[7], for: .normal)
        numberButton8.setTitle(numberArray[8], for: .normal)
        
    }

    @objc func down() {
        
        count = count - 0.01
        
        timerLabel2.text = String(format: "%.2f",count)
        
      
    }
    
    @IBAction func tapNumber(sender: UIButton){
        
       
        
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
