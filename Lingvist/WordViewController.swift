//
//  WordViewController.swift
//  Lingvist
//
//  Created by Xiaowen WANG on 2018/1/16.
//  Copyright © 2018年 Xiaowen WANG. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {
    
    var wordAct : Word = Word.init()
    var wordList : [Word] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setWordList()
        selectWord()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var labelHint: UILabel!
    @IBOutlet weak var labelBool: UILabel!
    @IBOutlet weak var textFieldInput: UITextField!
    @IBAction func buttonEnter() {
        if textFieldInput.text == self.wordAct.Answer(){
            labelBool.text = "Correct!"
        }else{
            labelBool.text = "Wrong..."
        }
    }
    @IBAction func buttonNext() {
        selectWord()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setWordList(){
        let w1 = Word.init(id: 1, answer: "time", hint: "le temps, l'heure")
        let w2 = Word.init(id: 2, answer: "world", hint: "le monde")
        let w3 = Word.init(id: 3, answer: "place", hint: "un endroit, un lieu")
        self.wordList = [w1, w2, w3]
    }
    
    func selectWord() {
        let position = randomCustom(min: 1, max: 3) - 1
        let wordResultat = self.wordList[position]
        self.wordAct.setId(id: wordResultat.Id())
        self.wordAct.setAnswer(answer: wordResultat.Answer())
        self.wordAct.setHint(hint: wordResultat.Hint())
        labelHint.text = self.wordAct.Hint()
        labelBool.text = ""
        
    }
    
    func randomCustom(min: Int, max: Int) -> Int {
        //  [min, max)  [0, 100)
        //        var x = arc4random() % UInt32(max);
        //        return Int(x)
        // [min, max）
        let y = arc4random() % UInt32(max) + UInt32(min)
        print(Int(y))
        return Int(y)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
