//
//  Quiz3.swift
//  JLPTQuiz
//
//  Created by Thidar Phyo on 9/29/22.
//
import SwiftUI

struct Quiz3: View {
    @State var i : Int = 0
         
        //var for the score
        @State var score = 0
        @State private var showActionSheet = false
         
        var body: some View {
            VStack(alignment: .leading,spacing: 15){
                 
                //if i < of questions --> play question
                if(self.i < myQuiz3.count){
                     
                     
                   
                    Image(myQuiz3[self.i].img!)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                    Text(myQuiz3[self.i].text!)
                        .font(.system(size: 30, weight: .bold))
                        .lineSpacing(6.0)
                        .padding(.horizontal, 12)

                    ForEach(myQuiz3[self.i].answer.indices,id:\.self){ ansIndex in
                        Button(action:{
                            //self.buttonAction(n: 3)
                            print(self.i)
                            print(myQuiz3[self.i].answer[ansIndex])
                            print(ansIndex)
                            //print(myQuiz1[self.i].correct)
//                            if ansIndex == myQuiz1[self.i].correct {
//                                self.score = score + 1
//                            }
//                            self.showActionSheet = true
//                            //self.selected = "\(ansIndex)"
//                            self.selected = "\(myQuiz1[index].answer[ansIndex])"
                            
                            self.showActionSheet = true
                            self.buttonAction(n: ansIndex)
                        },label: {
                            
                            Text(myQuiz3[self.i].answer[ansIndex])
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
                            message: Text("Score : \(self.score) / \(myQuiz3.count)"),
                            buttons: [
                                .cancel { print(self.showActionSheet) }
                            ]
                        )
                    }
     
                }
                     
                //after last question --> show final view with score
                else{
                    FinalView(score : self.score)
                }
                 
                 
            }
            .padding(.horizontal)
        }
         
         
        //action of the buttons
        //n = answer [0,1,2,3]
        func buttonAction( n : Int){
            //if answer is correct increment score
            if(myQuiz3[self.i].correct == n){
                self.score = self.score + 1
            }
            //GO TO NEXT QUESTION
            self.i = self.i + 1
             
        }
    
}

struct Quiz3_Previews: PreviewProvider {
    static var previews: some View {
        Quiz3()
    }
}

