//
//  QuizResultViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-12.
//

import UIKit

class QuizResultViewController: UIViewController {
    
    var yourScore: Int!
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var chickenImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var yourScoreLabel: UILabel!
    
    var gFunction = GlobalFunction()
    
    @IBOutlet weak var playAgainBnt: UIButton!
    @IBOutlet weak var gotoSubmenuBnt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yourScoreLabel.text = "\(yourScore ?? 0) / \(kMaxQuiz)"
        
        UIView.animate(withDuration: 0.4,
            animations: {
                self.chickenImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.4) {
                    self.chickenImage.transform = CGAffineTransform.identity
                }
            })
        
        setTheme()
        playAgainBnt.startAnimatingPressActions()
       
    }
    
    @IBAction func goToSubmenu(_ sender: UIButton) {
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen , identifier: "SubMenuVC")
    }
    
    @IBAction func goToTestPress(_ sender: UIButton) {
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen, identifier: "QuizVC")
    }
    
    private func setTheme(){
    if kCurrentScreen == "Alphabet" {
        headerLabel.text = textLib.alphabetScreen.yourScoreHeader
        playAgainBnt.setTitle(textLib.alphabetScreen.playAgainBntTitle, for: .normal)
        gotoSubmenuBnt.setTitle(textLib.alphabetScreen.gotoSubmenuBntTitle, for: .normal)
    } else {
        headerLabel.text = textLib.vowelScreen.yourScoreHeader
        playAgainBnt.setTitle(textLib.vowelScreen.playAgainBntTitle, for: .normal)
        gotoSubmenuBnt.setTitle(textLib.vowelScreen.gotoSubmenuBntTitle, for: .normal)
    }
    playAgainBnt.backgroundColor = kQuizBntColor
    gotoSubmenuBnt.backgroundColor = kAlphabetColor
        
    headerLabel.textColor = kHeaderLabelColor
    yourScoreLabel.textColor = kHeaderLabelColor
    parentView.backgroundColor = textLib.alphabetScreen.parentViewBackground
    
    gFunction.setCornerRadius(Bnt: playAgainBnt, cornerRaddius: kButtonCornerRaddius)
    gFunction.setCornerRadius(Bnt: gotoSubmenuBnt, cornerRaddius: kButtonCornerRaddius)
    
    gFunction.setMenuButtonCornerRadius(Bnt: playAgainBnt)
    gFunction.setMenuButtonCornerRadius(Bnt: gotoSubmenuBnt)
 
    }
}
 
