//
//  ContentView.swift
//  JLPTQuiz
//
//  Created by Thidar Phyo on 9/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcom to the quiz game")
                NavigationLink {
                    Quiz1()
                } label: {
                    Text("Start Quiz")
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
