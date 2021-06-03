//
//  ContentView.swift
//  War! Card Game
//
//  Created by Diane R. Warde on 5/30/21.
//

import SwiftUI

struct GameView: View {
 
    @State var playerCard = "back"
    @State var challengerCard = "back"
    @State var playerGameDeck:[String]
    @State var challengerGameDeck:[String]
    @State var playerScore = 0
    @State var challengerScore = 0
    
    @EnvironmentObject var model:CardModel
    
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
                        let model = CardModel()
                        var playerGameDeck = model.playerStartDeck
                        var challengerGameDeck = model.challengerStartDeck
                       
                        //choose a random card for each person
                        func randomCard(){
                            let playerCardRandom = Int.random(in: 1...52)
                            let challengerCardRandom = Int.random(in: 1...52)

                            
                            playerCard = "card" + String("\(playerCardRandom)")
                            challengerCard = "card" + String("\(challengerCardRandom)")
                        }
                        
                        //check if cards are in respective decks
                        if playerGameDeck.contains("\(playerCard)") || challengerGameDeck.contains("\(challengerCard)") {
                            updateDecks()
                            updateScores()
                        } else {
                            randomCard()
                        }
                        
                        //update decks
                        func updateDecks() {
                        if playerCard > challengerCard {
                            if let index = challengerGameDeck.firstIndex(of: ("\(challengerCard)"))
                                {
                                    challengerGameDeck.remove(at: index)
                                }
                            }
                        else if challengerCard > playerCard {
                            challengerGameDeck.append(playerCard)
                            if let index = playerGameDeck.firstIndex(of: ("\(playerCard)"))
                                {
                                playerGameDeck.remove(at: index)
                                }
                            }
                        }
                        //update Scores
                        func updateScores() {
                            if playerCard > challengerCard {
                                playerScore += 1
                            } else if playerCard < challengerCard {
                            challengerScore += 1
                            }
                        }
                    //check if decks are empty
                    if playerGameDeck.isEmpty {
                        Text("Player has no cards left. Challenger wins!")
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                    } else if challengerGameDeck.isEmpty {
                        Text("Challenger has no cards left. Player wins!")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                    }
                    //check if a someone has reached 100 points
                        if playerScore == 100{
                            Text("Player wins with a score of 100 points!")
                                .foregroundColor(.blue)
                                .font(.largeTitle)
                        } else if challengerScore == 100 {
                            Text("Challenger wins with a score of 200 points!")
                                .foregroundColor(.red)
                                .font(.largeTitle)
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
                                playerGameDeck = []
                                playerScore = 0
                                challengerGameDeck = []
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
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
       
        GameView (playerGameDeck: [""], challengerGameDeck: [""]).environmentObject(CardModel())
    }
}

