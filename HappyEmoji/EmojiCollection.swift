//
//  EmojiCollection.swift
//  HappyEmoji
//
//  Created by Brendan Lau on 3/29/17.
//  Copyright © 2017 Brendan Lau. All rights reserved.
//

import UIKit

enum emojiRange {
    case smiliesAndPeople
    case animalsAndNature
    case foodAndDrink
    case activity
    case travelAndPlaces
    case objects
    case symbols
    case flags
}

class EmojiCollection: NSObject {
    
    let collection: [String]! // Collection of all emoji strings
    
    override init() {
        self.collection = []
        let emojiRanges = [0x1F601...0x1F64F, 0x2702...0x27B0, 0x1F680...0x1F6C0, 0x1F170...0x1F251]
        for range in emojiRanges {
            for i in range { self.collection.append(String(describing: UnicodeScalar(i))) }
        }
    }
    
    public func getEmojis(range: emojiRange) -> [String] {
        switch range {
        case .smiliesAndPeople: return collection
        case .animalsAndNature: return collection
        case .foodAndDrink: return collection
        case .activity: return collection
        case .travelAndPlaces: return collection
        case .objects: return collection
        case .symbols: return collection
        case .flags: return collection
        }
    }
    

}
