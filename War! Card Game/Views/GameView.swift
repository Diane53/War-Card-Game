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
                        //create card decks
                        var playerStartDeck = ["card 1":2, "card 2":2, "card 5":3, "card 6":3, "card 9":4, "card 10":4, "card 13":5, "card 14":5, "card 17":6, "card 18":6, "card 21":7, "card 22":7, "card 25":8, "card 26":8, "card 29":9, "card 30":9, "card 33":10, "card 34":10, "card 37":11, "card 39":11, "card 41":12, "card 42":12, "card 45":13, "card 46":13, "card 49":14, "card 50":14]
                        
                        var challengerStartDeck = ["card 3":2, "card 4":2, "card 7":3, "card 8":3, "card 11":4, "card 12":4, "card 15":5, "card 16":5, "card 19":6, "card 20":6,  "card 23":7, "card 24":7, "card 27":8, "card 28":8, "card 31":9, "card 32":9, "card 35":10, "card 36":10, "card 39":11, "card 40":11, "card 43":12, "card 44":12, "card 47":13, "card 48":13, "card 51":14, "card 52":14]
                        // Generate a random number for each card array
                        var playerGameDeck = playerStartDeck
                            var playerCardRandom = Int.random(in: 1...52)
    
                        var challengerGameDeck = challengerStartDeck
                        var challengerCardRandom = Int.random(in: 1...52)
                            
                        // Update the cards
                        playerCard = "card " + String("\(playerCardRandom)")
                        challengerCard = "card " + String("\(challengerCardRandom)")
                        //check to see if the card is in the corresponding deck;
                                //if not deal another card
                        if playerGameDeck["\(challengerCardRandom)"] == nil ||
                            challengerGameDeck["\(challengerCardRandom)"] == nil
                            {
                            var playerCardRandom = Int.random(in: 1...52)
                            var challengerCardRandom = Int.random(in: 1...52)
                        }
                        // Update the score
                            //compare player and challenger cards to see which is higher
                            
                            if ["\(playerCardRandom)":Int] > challengerGameDeck["\(challengerCardRandom)":Int] {
                            playerScore += 1
                            //add the card to Player's deck
                            playerGameDeck["\(challengerCardRandom)":Int]
                            // remove the card from Challenger's deck
                            if let value =  challengerGameDeck.removeValue(forKey: "\(challengerCardRandom)"){}
                        } else if playerGameDeck["\(playerCardRandom)", value: Int] < challengerGameDeck["\(challengerCardRandom)", value: Int] {
                                challengerScore += 1
                                //add the card to Challenger's deck
                                challengerGameDeck["\(playerCardRandom)"]
                                // remove the card from Challenger's deck
                            if let value =  playerGameDeck.removeValue(forKey: "\(playerCardRandom)"){}
                        }
                        //check if decks are empty
                            if playerGameDeck.isEmpty {
                                Text("Player has no cards left. Challenger wins!")
                            } else if challengerGameDeck.isEmpty {
                                Text("Challenger has no cards left. Player wins!")
                                    }
                        //check if a scpremhas reach 200 points
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
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
