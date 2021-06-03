//
//  AboutView.swift
//  War! Card Game
//
//  Created by Diane.Warde on 6/1/21.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        ZStack{
            
            VStack{
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
                Text("War Card Game is a two player game: the Player is you, and the Challenger is your device.")
                Text("Press the Deal button to deal cards.")
                Text("Whoever has the highest card gets one point and takes both cards; the other player loses their card.")
                Text("The game ends when one player runs out of cards or one player scores 200 points.")
                Spacer()
                Text("©June 2021,Diane R. Warde")
            }
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

