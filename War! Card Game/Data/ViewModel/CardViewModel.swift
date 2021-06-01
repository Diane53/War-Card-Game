//
//  CardViewModel.swift
//  War! Card Game
//
//  Created by Diane R. Warde on 6/1/21.
//

import Foundation

class CardViewModel: ObservableObject {
    
    @Published var card = [Card]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.card = DataService.getLocalData()
        
        
    }
}
