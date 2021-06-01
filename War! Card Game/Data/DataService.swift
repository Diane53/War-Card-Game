//
//  DataService.swift
//  War! Card Game
//
//  Created by Diane R. Warde on 6/1/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Card] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "Cards", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Card]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let cardData = try decoder.decode([Card].self, from: data)
                
                // Add the unique IDs
                for card in cardData {
                    card.id = UUID()
                }
                
                // Return the recipes
                return cardData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Card]()
    }
    
}

