//
//  ContentView.swift
//  Milestone-Projects-1-3
//
//  Created by Mac on 09/03/2024.
//

import SwiftUI

struct ContentView: View {
    let choices = ["Rock","Paper","Scissor"]
    @State private var pickedChoice = Int.random(in: 0...2)
    @State private var toWin = Bool.random()
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var alertShowen = false
    @State private var alertMessage = ""
    @State private var roundNumber = 1
    
    var body: some View {
        ZStack {
            RadialGradient(stops:[
                .init(color: .red, location: 0.3),
                .init(color: .blue, location:0.3)
            ],center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    TitleLabel(text: "Brain Teaser")
                    Text("App selected \(choices[pickedChoice])")
                        .font(.title.bold())
                    Text("Select the option to \(toWin ? "Win" : "Lose")")
                        .font(.title3.bold())
                }
                Spacer()
                Spacer()
                HStack {
                    ForEach(0..<choices.count, id: \.self) { choiceIndex in
                        ChoiceButton(title: choices[choiceIndex]) {
                            choiceButtonTapped(userChoiceIndex: choiceIndex)
                        }
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 8))
                Spacer()
                Spacer()
                HStack {
                    Text("Round \(roundNumber)")
                    Spacer()
                    Text("Your score is \(score)")
                }
                .padding(.horizontal, 20)
                
            }
        }.alert(alertTitle, isPresented: $alertShowen) {
            Button(roundNumber >= 10 ? "Restart" : "Continue") {
                if roundNumber >= 10 {
                    score = 0
                    roundNumber = 1
                }
                pickedChoice = Int.random(in: 0..<choices.count)
                toWin = Bool.random()
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    func didUserWinTheRound(userChoiceIndex: Int) -> Bool {
        if pickedChoice == 0 && userChoiceIndex == 1 {
            return true
        }
        if pickedChoice == 1 && userChoiceIndex == 2 {
            return true
        }
        if pickedChoice == 2 && userChoiceIndex == 0 {
            return true
        }
        return false
    }
    
    func didUserSelectCorrectly(userChoiceIndex: Int) -> Bool {
        didUserWinTheRound(userChoiceIndex: userChoiceIndex) == toWin
    }
    
    func choiceButtonTapped(userChoiceIndex: Int) {
        let didUserWinTheRound = didUserSelectCorrectly(userChoiceIndex: userChoiceIndex)
        if didUserWinTheRound {
            score += 1
            alertTitle = "Correct"
            alertMessage = "You picked correctly, your score now is \(score)"
        } else {
            score = max(0, score - 1)
            alertTitle = "Wrong"
            alertMessage = "You picked the wrong choice, your score now is \(score)"
        }
        roundNumber += 1
        alertShowen = true
    }
}

#Preview {
    ContentView()
}
