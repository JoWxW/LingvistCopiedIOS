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
        let w4 = Word.init(id: 4, answer: "home", hint: "la maison, le domicile")
        let w5 = Word.init(id: 5, answer: "year", hint: "un ans, une année")
        let w6 = Word.init(id: 6, answer: "man", hint: "un homme")
        let w7 = Word.init(id: 7, answer: "night", hint: "la nuit")
        let w8 = Word.init(id: 8, answer: "car", hint: "une voiture")
        let w9 = Word.init(id: 9, answer: "school", hint: "l'école")
        let w10 = Word.init(id: 10, answer: "numbre", hint: "un nombre, chiffre, un numéro")
        self.wordList = [w1, w2, w3, w4, w5, w6, w7, w8, w9, w10]
    }
    
    func selectWord() {
        let position = randomCustom(min: 1, max: 10) - 1
        let wordResultat = self.wordList[position]
        self.wordAct.setId(id: wordResultat.Id())
        self.wordAct.setAnswer(answer: wordResultat.Answer())
        self.wordAct.setHint(hint: wordResultat.Hint())
        labelHint.text = self.wordAct.Hint()
        labelBool.text = ""
        textFieldInput.text = ""
        
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
