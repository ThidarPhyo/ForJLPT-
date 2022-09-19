//
//  ContentView.swift
//  JLPTQuiz
//
//  Created by Thidar Phyo on 9/18/22.
//

import SwiftUI
 
struct ContentView: View {
     
    //var for the score
    @State var score = 0
     
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                 
                Text("Welcome to the JLPT quiz game")
                 
                //button to start the quiz
                NavigationLink(destination: Quiz1()) {
                    Text("START QUIZ")
                }
                HStack{
                    //display your score
                    Text("last score : \(self.score) / \(myQuiz1.count)")
                        .onAppear(){ //refresh score
                            self.score = LoadScore(quiz: "myQuiz1")
                    }
                }
            }
            .navigationBarTitle("JLPT Quiz example",displayMode: .inline)
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
