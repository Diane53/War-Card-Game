//
//  ContentView.swift
//  War! Card Game
//
//  Created by Diane R. Warde on 5/30/21.
//

import SwiftUI

struct GameView: View {

    @EnvironmentObject var model:CardViewModel
    
    @State private var playerCard = "back"
    @State private var challengerCard = "back"
    @State private var playerScore = 0
    @State private var challengerScore = 0
   
   

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
                        // Generate a random number for each card array
                            var playerGameDeck = playerStartDeck
                            var playerCardRandom = Int.random(in: 0..<playerGameDeck.count)
    
                            var challengerGameDeck = challengerStartDeck
                            var challengerCardRandom = Int.random(in: 0..<challengerGameDeck.count)
                            
                        // Update the cards
                        playerCard = "card " + String("\(playerCardRandom)")
                        challengerCard = "card " + String("\(challengerCardRandom)")
                        // Update the score
                        if playerCard(value for key("value")) > challengerCard(value for key ("value")) {
                            playerScore += 1
                            playerGameDeck.append(challengerCard)
                            // Check to remove the existing element
                            if let challengerIndex = challengerGameDeck.firstIndex(of: "\(challengerCardRandom)") {
                             challengerGameDeck.remove(at: challengerIndex)
                                }
                            } else if
                                challengerCard(value for key("value")) > (value for key("value")) {
                                    challengerScore += 1
                                challengerGameDeck.append(playerCard)
                                // Check to remove the existing element
                                if let playerIndex = playerGameDeck.firstIndex(of: "\(playerCardRandom)") {
                                 playerGameDeck.remove(at: playerIndex)
                                    }
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
                                if playerScore == 200 || challengerScore == 200 {
                                    Text("GAME OVER").fontWeight(.bold).foregroundColor(.white).background(Color(red: 0.765, green: 0.224, blue: 0.814))
                                      
                                }
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
            .environmentObject(CardViewModel())
    }
}
