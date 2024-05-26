//
//  ContentView.swift
//  Card_Game_R4
//
//  Created by Tafadzwa Alexander Razaro on 2024/05/26.
//

import SwiftUI

struct GameView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var playerWins = 0
    @State var cpuWins = 0
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    Text("WINS:")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                    HStack{
                        Spacer()
                        HStack{
                            Text("Player: ")
                                .foregroundColor(Color.white)
                            Text(String(playerWins))
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        HStack{
                            Text("CPU")
                                .foregroundColor(Color.white)
                            Text(String(cpuWins))
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
    
    func deal(){
        
        //Change the player cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Change the cpu cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Increase the player score
        if playerCard > cpuCard  && playerScore < 100{
            playerScore += 4
        }
        if playerScore > 100{
            playerScore = 100
        }
        
        //Increase the cpu score
        if cpuCard > playerCard && cpuScore < 100{
            cpuScore += 4
        }
        if cpuScore > 100{
            cpuScore = 100
        }
        
        //Add 1 to both scores if cards are equal
        else if playerCard == cpuCard && playerScore > 101 && cpuScore > 101{
            playerScore += 1
            cpuScore += 1
        }
        
        //Increase the player win count
        if playerScore == 100 && cpuScore < 100{
            playerWins += 1
            playerScore = 0
            cpuScore = 0
            playerCard = "back"
            cpuCard = "back"
        }
        
        //Increase the cpu win count
        if cpuScore == 100 && playerScore < 100{
            cpuWins += 1
            cpuScore = 0
            playerScore = 0
            cpuCard = "back"
            playerCard = "back"
        }
    }
}

#Preview {
    GameView()
}
