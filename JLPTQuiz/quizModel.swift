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
    var lastText: String?
    var answer : [String]
    //specify what is the correct answer
    var correct : Int?
    var kanji : String?
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
var myQuiz2 : [QuizModel] = [
 
    QuizModel(img: "flag1",
    text: "このような服装が若者の間で急速に流行した最大の", lastText: "は、テレビの普及によって情報が同時に全国に伝わったからであろう。",
    answer: [" げいん"," げいいんん"," げんいん","げにん"],
    correct: 3,kanji: "原因"),
     
    QuizModel(img: "flag2",
    text: "この箱の中のお菓子を一人に十個ずつ渡してください。そして、",lastText: "、戻してください。",
    answer: [" しまったら","あまったら"," くばったら"," のこったら"],
    correct: 1,kanji: "余ったら"),
     
    QuizModel(img: "flag3",
    text: "",lastText: "は速達で郵送しましたが、まだ届いていないそうです。",
    answer: ["しょるい","しか","かりょう","しりょう"],
    correct: 3,kanji: "資料"),
     
    QuizModel(img: "flag4",
    text: "資料は速達で",lastText: "しましたが、まだ届いていないそうです。",
    answer: ["ゆうそ","ゆぞう","ゆうそう","ゆそう"],
    correct: 2,kanji: "郵送"),
     
    QuizModel(img: "flag5",
    text: "あそこの",lastText: "歩道橋を渡ると、上野駅は右側にあります。",
    answer: ["おうたん","よこたち","よこだち","おうだん"],
    correct: 3,kanji: "横断"),
 
]
var myQuiz3 : [QuizModel] = [
 
    QuizModel(img: "img1",
    text: "横断",answer: ["おうたん","よこたち","よこだち","おうだん"],
    correct: 3),
     
    QuizModel(img: "img2",
    text: "郵送",answer: ["ゆうそ","ゆぞう","ゆうそう","ゆそう"],
    correct: 2),
     
    QuizModel(img: "flag3",
    text: "資料",answer: ["しょるい","しか","かりょう","しりょう"],
    correct: 3),
     
    QuizModel(img: "flag4",
    text: "余ったら",answer: [" しまったら","あまったら"," くばったら"," のこったら"],
    correct: 1),
     
    QuizModel(img: "flag5",
    text: "原因",answer: [" げいん"," げいいんん"," げんいん","げにん"],
    correct: 3),
 
]
 
func SaveScore(quiz : String , score : Int){
    UserDefaults.standard.set(score, forKey: quiz)
}
 
func LoadScore (quiz : String) -> Int{
    return UserDefaults.standard.integer(forKey: quiz)
}
