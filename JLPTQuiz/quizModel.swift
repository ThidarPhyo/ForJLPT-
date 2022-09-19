//
//  quizModel.swift
//  JLPTQuiz
//
//  Created by Thidar Phyo on 9/18/22.
//

import Foundation
 
struct QuizModel  {
    var img : String?
    var text : String?
    var answer : [String]
    //specify what is the correct answer
    var correct : Int?
}
 
//final quiz is an array of quizmodel
var myQuiz1 : [QuizModel] = [
 
    QuizModel(img: "flag1",
    text: "括弧で囲んだ内容を削除し、文章を簡潔にしました。",
    answer: ["かっし","かついん","かっこう","かっこ"],
    correct: 3),
     
    QuizModel(img: "flag2",
    text: "括弧で囲んだ内容を削除し、文章を簡潔にしました。",
    answer: ["さくじょう","さくじょ","しょうじょ ","しょうじょう "],
    correct: 1),
     
    QuizModel(img: "flag3",
    text: "資料は速達で郵送しましたが、まだ届いていないそうです。",
    answer: ["しょるい","しか","かりょう","しりょう"],
    correct: 3),
     
    QuizModel(img: "flag4",
    text: "資料は速達で郵送しましたが、まだ届いていないそうです。",
    answer: ["ゆうそ","ゆぞう","ゆうそう","ゆそう"],
    correct: 2),
     
    QuizModel(img: "flag5",
    text: "あそこの横断歩道橋を渡ると、上野駅は右側にあります。",
    answer: ["おうたん","よこたち","よこだち","おうだん"],
    correct: 3),
 
]
 
func SaveScore(quiz : String , score : Int){
    UserDefaults.standard.set(score, forKey: quiz)
}
 
func LoadScore (quiz : String) -> Int{
    return UserDefaults.standard.integer(forKey: quiz)
}
