//
//  GeneralConstants.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-02.
//

import Foundation
import UIKit

public let kMaxQuiz = 5
public let kNextQuesionDelay = 2.0
public let kPlaySoundDelay = 0.2
public var kCurrentScreen = ""
public let kButtonCornerRaddius = 20
public let kHidesBottomBar = true
public let kIsNavigationVC = false

public let kPrimaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
public let kAlphabetColor = #colorLiteral(red: 0.918459475, green: 0.6915696263, blue: 0.5719199777, alpha: 0.9991455078)
public let kVowelColor = #colorLiteral(red: 0.827039659, green: 0.7227360606, blue: 0.9373013377, alpha: 1)
public let kSettingColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
public let kQuizBntColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)

struct textLib {
    struct homeScreen {
        static let navigationTitle = "Home"
        static let parentViewBackground = kPrimaryColor
        static let headerLabel = "Menu"
        static let alphabetBntTitle = "Learn Alphabet"
        static let vowelBntTitle = "Learn Vowel"
        static let settingBntTitle = "Setting"
    }
    
    struct alphabetScreen {
        static let navigationTitle = "Alphabet"
        static let parentViewBackground = kAlphabetColor
        static let headerLabel = "Alphabet"
        static let learnBntTitle = "Flash Card"
        static let showAllBntTitle = "All Alphabets"
        static let quizBntTitle = "Quiz"
    }
    
    struct vowelScreen {
        static let navigationTitle = "Vowel"
        static let parentViewBackground = kVowelColor
        static let headerLabel = "Vowel"
        static let learnBntTitle = "Flash Card"
        static let showAllBntTitle = "All Volels"
        static let quizBntTitle = "Test"
    }
    
    struct settingScreen {
        static let navigationTitle = "Setting"
        static let parentViewBackground = kSettingColor
        static let headerLabel = "Setting"
        static let alphabetSoundLabel = "Alphabet Sound"
        static let vowelSoundLabel = "Vowel Sound"
        static let correctSoundLable = "Correct Sound"
        static let setDefaultBntTitle = "Set Default"
    }
    
    struct AlphabetQuizScreen {
        static let navigationTitle = "Alphabet Quiz"
        static let headerLabel = "Alphabet Quiz"
        static let parentViewBackground = kAlphabetColor
    }
    
    struct VowelQuizScreen {
        static let navigationTitle = "Vowel Quiz"
        static let headerLabel = "Vowel Quiz"
        static let parentViewBackground = kVowelColor
    }
}

