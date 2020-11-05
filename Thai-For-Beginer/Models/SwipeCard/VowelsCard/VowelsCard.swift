//
//  VowelsCard.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-03.
//

import Foundation
import Shuffle_iOS

class VowelsCard: SwipeCard {
        
    func configure(withModel model: VowelsCardModel) {
        content = SwipeCardContentView(withImage: UIImage(named: model.code))
        footer = SwipeCardFooterView(withTitle: "\(model.nameInThai), \(model.nameInEnglish)", subTitle: model.similarSound!)
    }
}

