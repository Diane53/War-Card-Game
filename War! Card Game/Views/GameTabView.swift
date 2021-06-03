//
//  TabView.swift
//  War! Card Game
//
//  Created by Diane R. Warde on 6/1/21.
//

import SwiftUI

struct GameTabView: View {
        var body: some View {
            
            TabView {
                
                GameView(playerGameDeck: [String], challengerGameDeck: [String])
                    .tabItem {
                        VStack {
                            Image(systemName: "circle.fill.square.fill")
                            Text("Game")
                        }
                    }
                
                AboutView()
                    .tabItem {
                        VStack {
                            Image(systemName: "text.justifyleft")
                            Text("About")
                        }
                    }
            }
            .environmentObject(CardViewModel())
        }
}

struct GameTabView_Previews: PreviewProvider {
    static var previews: some View {
        GameTabView()
    }
}
