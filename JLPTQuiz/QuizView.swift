//
//  QuizView.swift
//  JLPTQuiz
//
//  Created by Thidar Phyo on 9/18/22.
//

import SwiftUI
 
//view for the quiz game
struct Quiz1 : View {
     
    //number of question
    @State var i : Int = 0
     
    //var for the score
    @State var score = 0
    @State private var showActionSheet = false
     
    var body: some View {
        VStack(alignment: .leading,spacing: 15){
             
            //if i < of questions --> play question
//            if(self.i < myQuiz1.count){
//
//
//                //image of the question
//                Image(myQuiz1[self.i].img!)
//                    .resizable()
//                    .scaledToFit()
//                    .padding(.horizontal)
//
//                //text of the question
//                Text(myQuiz1[self.i].text!)
//
//
//                //answer 0
//                Button(action:{
//                    self.showActionSheet = true
//                    self.buttonAction(n: 0)
//                },label: {
//                    Text(myQuiz1[self.i].answer[0])
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.blue,lineWidth: 2)
//                        )
//                })
//                .actionSheet(isPresented: $showActionSheet) {
//                    ActionSheet(
//                        title: Text("Score"),
//                        message: Text("Score : \(self.score) / \(myQuiz1.count)"),
//                        buttons: [
//                            .cancel { print(self.showActionSheet) }
//                        ]
//                    )
//                }
//
//                //answer 1
//                Button(action:{
//                    self.buttonAction(n: 1)
//                    self.showActionSheet = true
//                },label: {
//                    Text(myQuiz1[self.i].answer[1])
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.blue,lineWidth: 2)
//                        )
//                })
//                .actionSheet(isPresented: $showActionSheet) {
//                    ActionSheet(
//                        title: Text("Score"),
//                        message: Text("Score : \(self.score) / \(myQuiz1.count)"),
//                        buttons: [
//                            .cancel { print(self.showActionSheet) }
//                        ]
//                    )
//                }
//
//                //answer 2
//                Button(action:{
//                    self.buttonAction(n: 2)
//                    self.showActionSheet = true
//                },label: {
//                    Text(myQuiz1[self.i].answer[2])
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.blue,lineWidth: 2)
//                        )
//                })
//                .actionSheet(isPresented: $showActionSheet) {
//                    ActionSheet(
//                        title: Text("Score"),
//                        message: Text("Score : \(self.score) / \(myQuiz1.count)"),
//                        buttons: [
//                            .cancel { print(self.showActionSheet) }
//                        ]
//                    )
//                }
//
//                //answer 3
//                Button(action:{
//                    self.buttonAction(n: 3)
//                    self.showActionSheet = true
//                },label: {
//                    Text(myQuiz1[self.i].answer[3])
//                        .foregroundColor(.black)
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.blue,lineWidth: 2)
//                        )
//                })
//                .actionSheet(isPresented: $showActionSheet) {
//                    ActionSheet(
//                        title: Text("Score"),
//                        message: Text("Score : \(self.score) / \(myQuiz1.count)"),
//                        buttons: [
//                            .cancel { print(self.showActionSheet) }
//                        ]
//                    )
//                }
//
//            }
//
//            //after last question --> show final view with score
//            else{
//                FinalView(score : self.score)
//            }
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 20){
                    ForEach(myQuiz1.indices,id:\.self) { index in
//                        Image(myQuiz1[self.i].img!)
//                            .resizable()
//                            .scaledToFit()
//                            .padding(.horizontal)

                        //text of the question
                        Text("(\(index+1)) \(myQuiz1[index].text!)")
                        ForEach(myQuiz1[index].answer.indices,id:\.self){ ansIndex in
                            Button(action:{
                                //self.buttonAction(n: 3)
//                                print(myQuiz1[index].correct)
//                                print(ansIndex)
                                if ansIndex == myQuiz1[index].correct {
                                    self.score = score + 1
                                }
                                self.showActionSheet = true
                            },label: {
                                Text(myQuiz1[index].answer[ansIndex])
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue,lineWidth: 2)
                                    )
                            })
                        }
                        
                        .actionSheet(isPresented: $showActionSheet) {
                            ActionSheet(
                                title: Text("Score"),
                                message: Text("Score : \(self.score) / \(myQuiz1.count)"),
                                buttons: [
                                    .cancel { print(self.showActionSheet) }
                                ]
                            )
                        }
                    }
                    .onDisappear(){
                        //SaveScore(quiz: "myQuiz1", score: self.score)
                        //ActionSheet(title: Text("Hello"))
                    }
                    .navigationBarTitle("JLPT Exam")
                    
                    
                }
            }
             
        }
        .padding(.horizontal)
    }

}
 
struct Quiz1_reviews: PreviewProvider {
    static var previews: some View {
        Quiz1()
    }
}
