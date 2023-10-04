//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Maggie Li on 2023/10/04.
//

import SwiftUI

struct ContentView: View {
    @State private var userChoice = ""
    @State private var result = ""
    
    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.blue)
            
            Text("Choose your move:")
                .font(.headline)
                .padding()
            
            HStack {
                Button(action: {
                    playGame(userChoice: "rock")
                }) {
                    Image("rock")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Rock")
                }
                .buttonStyle(RoundedButtonStyle())

                Button(action: {
                    playGame(userChoice: "paper")
                }) {
                    Image("paper")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Paper")
                }
                .buttonStyle(RoundedButtonStyle())
                
                Button(action: {
                    playGame(userChoice: "scissors")
                }) {
                    Image("scissors")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Scissors")
                }
                .buttonStyle(RoundedButtonStyle())
            }
            
            Text("Result: \(result)")
                .font(.headline)
                .padding()
        }
    }
    

    struct RoundedButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
    
//    Swift
        func playGame(userChoice: String) {
            let compChoice = getComputerChoice()
            let winner = determineWinner(userChoice, compChoice)
            var result = winner
        }
        
        func getComputerChoice() -> String {
            let randomNumber = Int.random(in: 0...2)
            
            switch randomNumber {
            case 0:
                return "rock"
            case 1:
                return "paper"
            case 2:
                return "scissors"
            default:
                return "Something went wrong"
            }
        }
        
        func determineWinner(_ userChoice: String, _ compChoice: String) -> String {
            var decision = "It's a tie"
            
            switch userChoice {
            case "rock":
                if compChoice == "paper" {
                    decision = "The computer won"
                } else if compChoice == "scissors" {
                    decision = "You won"
                }
            case "paper":
                if compChoice == "rock" {
                    decision = "You won"
                } else if compChoice == "scissors" {
                    decision = "The computer won"
                }
            case "scissors":
                if compChoice == "rock" {
                    decision = "The computer won"
                } else if compChoice == "paper" {
                    decision = "You won"
                }
            default:
                decision = "Something went wrong"
            }
            return decision
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
