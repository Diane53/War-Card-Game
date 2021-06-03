//
//  ContentView.swift
//  War! Card Game
//
//  Created by Diane R. Warde on 5/30/21.
//

import SwiftUI

struct GameView: View {
 
    @State private var playerCard = "back"
    @State private var challengerCard = "back"
    @State private var playerScore = 0
    @State private var challengerScore = 0
    @State var playerGameDeck:[String:Int]
    @State var challengerGameDeck:[String:Int]
        
    var body: some View {
            
        VStack(alignment: .center) {
            //title
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Image("shield").resizable()
                    .frame(width: 75, height: 100)
                Spacer()
                Text("War!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.002, saturation: 0.592, brightness: 0.728))
                Spacer()
                Image("shield").resizable()
                    .frame(width: 75, height: 100)
                Spacer()
                }
            Spacer()
            //card images
            VStack{
               
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Image(playerCard).resizable()
                            .frame(width: 200, height: 350)
                    Spacer()
                    Image(challengerCard).resizable()
                        .frame(width: 200, height: 350)
                    Spacer()
                }
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    //Player Score Info
                    VStack(alignment: .center) {
                        Text("Player")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.565, saturation: 0.716, brightness: 0.667))
                            .padding(.bottom,   10.0)
                        Text(String(playerScore))
                                .font(.largeTitle)
                            .foregroundColor(Color(hue: 0.565, saturation: 0.716, brightness: 0.667))
                    }
                    Spacer()
                    //Adversary score info
                    VStack {
                        Text("Challenger")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.bottom,   10.0)
                            .foregroundColor(Color(hue: 0.002, saturation: 0.592, brightness: 0.728))
                            Text(String(challengerScore))
                                .foregroundColor(Color(hue: 0.002, saturation: 0.592, brightness: 0.728))
                            .font(.largeTitle)
                        }
                        Spacer()
                    }
                Spacer()
                    //Deal & New Game buttons
                HStack(alignment: .center){
                        Spacer()
                    Button(action: {
                        updateDecks()
                        }
                        // Update the score
                            if playerCard() > challengerCard() {
                            playerScore += 1
                        } else if playerCard() < challengerCard() {
                                challengerScore += 1
                        }
                        //check if decks are empty
                            if playerGameDeck.isEmpty {
                                Text("Player has no cards left. Challenger wins!")
                            } else if challengerGameDeck.isEmpty {
                                Text("Challenger has no cards left. Player wins!")
                                    }
                        //check if a someone has reach 200 points
                            if playerScore == 200{
                                Text("Player wins with a score of 200 points!")
                            } else if challengerScore == 200 {
                                Text("Challenger wins with a score of 200 points!")
                                }

                        },
                        
                    label: {
                            Image(systemName: "greetingcard.fill")
                                .foregroundColor(Color(red: 0.765, green: 0.224, blue: 0.814))
                            Text("Deal")
                                .fontWeight(.bold).foregroundColor(.white).background(Color(red: 0.765, green: 0.224, blue: 0.814))
                        })
                            Spacer()
                            Button(action: {
                                playerGameDeck = ["Card 1":2]
                                playerScore = 0
                                challengerGameDeck = ["Card 3":2]
                                challengerScore = 0
                            }, label: {
                            Image(systemName: "plus.square.fill")
                                .foregroundColor(Color(red: 0.241, green: 0.508, blue: 0.245))
                                    Text("New Game")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                        .foregroundColor(.white).background(Color(red: 0.241, green: 0.508, blue: 0.245))
                            })
                    Spacer()
                        }
                Spacer()
            }
            Spacer()
        }
    }

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
