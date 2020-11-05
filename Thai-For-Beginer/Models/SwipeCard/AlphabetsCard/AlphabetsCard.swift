//
//  AlphabetCard.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-01.
//

import Foundation
import Shuffle_iOS

class AlphabetsCard: SwipeCard {
        
    func configure(withModel model: AlphabetsCardModel) {
        content = SwipeCardContentView(withImage: UIImage(named: model.code))
        footer = SwipeCardFooterView(withTitle: "\(model.thaiName), \(model.RTGSName)", subTitle: model.meaning)
    }
}

