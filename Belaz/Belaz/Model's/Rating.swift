//
//  Rating.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/24/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

enum Rating: Int {
    case notRated, bad, good, great
    
    var image: UIImage {
        switch self {
        case .notRated: return UIImage(named: "rating")!
        case .bad: return UIImage(named: "dislike")!
        case .good: return UIImage(named: "good")!
        case .great: return UIImage(named: "great")!
        }
    }
    
}
