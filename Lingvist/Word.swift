//
//  Word.swift
//  Lingvist
//
//  Created by Xiaowen WANG on 2018/1/16.
//  Copyright © 2018年 Xiaowen WANG. All rights reserved.
//

import Foundation
class Word {
    private var id : Int
    private var answer : String
    private var hint : String
    
    public init(id: Int, answer: String, hint: String) {
        self.id = id
        self.answer = answer
        self.hint = hint
    }
    
    public init() {
        self.id = 0
        self.answer = "?"
        self.hint = "?"
    }
    
    public func insertValeur () -> [Word]{
       let w1 = Word.init(id: 1, answer: "time", hint: "le temps, l'heure")
        let w2 = Word.init(id: 2, answer: "world", hint: "le monde")
        let w3 = Word.init(id: 3, answer: "place", hint: "un endroit, un lieu")
        return [w1, w2, w3]
    }
    
    public func Id() -> Int{
        return self.id
    }
    public func Answer() -> String{
        return self.answer
    }
    public func Hint() -> String{
        return self.hint
    }
    
    public func setId(id:Int){
        self.id = id
    }
    public func setAnswer(answer:String){
        self.answer = answer
    }
    public func setHint(hint:String){
        self.hint = hint
    }

}
