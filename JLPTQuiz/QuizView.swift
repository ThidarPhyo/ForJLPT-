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
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var selected = ""
    @State var show = false
     
    var body: some View {
        VStack(alignment: .leading,spacing: 15){
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 32){
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
                                print(index)
                                print(myQuiz1[index].answer[ansIndex])
                                print(ansIndex)
                                if ansIndex == myQuiz1[index].correct {
                                    self.score = score + 1
                                }
                                self.showActionSheet = true
                                //self.selected = "\(ansIndex)"
                                self.selected = "\(myQuiz1[index].answer[ansIndex])"
                            },label: {
                                HStack {
                                    Text(myQuiz1[index].answer[ansIndex])
                                        .foregroundColor(.black)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.blue,lineWidth: 2)
                                        )
                                    Spacer()
                                    ZStack {
                                        Circle().fill(self.selected == "\(myQuiz1[index].answer[ansIndex])" ? Color.purple : Color.black.opacity(0.2)).frame(width: 18, height: 18)
                                        if self.selected == "\(ansIndex)" {
                                            Circle().stroke(Color.yellow,lineWidth: 4).frame(width: 25, height: 25)
                                        }
                                    }
                                }.foregroundColor(.black)
                                
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
                    .alert("Do you want to leave this page without see the answers?", isPresented: $showingDeleteAlert) {
                        Button("Yes", role: .destructive, action: dismissView)
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Are you sure?")
                    }
                    .navigationBarBackButtonHidden(true)
                            // Add your custom back button here
                            .navigationBarItems(leading:
                                Button(action: {
                                showingDeleteAlert = true
                                    //self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.left.circle")
                                        Text("Go Back")
                                    }
                            })
//                    .toolbar {
//
//                        Button {
//                            showingDeleteAlert = true
//                        } label: {
//                            Label("Delete this book", systemImage: "trash")
//                        }
//                    }
                }
            }
             
        }
        .padding(.horizontal)
        Button(action: {
            
        }) {
            Text("Continue").padding(.vertical).padding(.horizontal,25)
                .foregroundColor(.white)
        }
        .background(LinearGradient(gradient: .init(colors:[Color.red,Color.pink]), startPoint: .leading, endPoint: .trailing))
        .clipShape(Capsule())
        .disabled(self.selected != "" ? false : true)
    }
    func dismissView() {
        dismiss()
    }

}
 
struct Quiz1_reviews: PreviewProvider {
    static var previews: some View {
        Quiz1()
    }
}
