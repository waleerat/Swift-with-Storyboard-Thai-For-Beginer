//
//  AlphabetMenuViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-04.
//

import UIKit

class subMenuViewController: UIViewController {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var learnBnt: UIButton!
    @IBOutlet weak var quizBnt: UIButton!
    @IBOutlet weak var allCardsBnt: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
     
    var gFunction = GlobalFunction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    @IBAction func goToHomeMenu(_ sender: UIButton) {
        gFunction.gotoStoryboard(storyboard : "Main", identifier : "HomeVC")
    }
    
    @IBAction func goToLearnPress(_ sender: UIButton) {
        gFunction.gotoStoryboard(storyboard : "Main", identifier : "\(kCurrentScreen)CardVC")
    }
    
    @IBAction func goToShowAllCards(_ sender: UIButton) {
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen , identifier: "ShowAllCardVC")
    }
    
    @IBAction func goToTestPress(_ sender: UIButton) {
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen, identifier: "QuizVC")
    }
    
    private func setTheme(){
        if kCurrentScreen == "Alphabet" {
            headerLabel.text = textLib.alphabetScreen.headerLabel
            learnBnt.setTitle(textLib.alphabetScreen.learnBntTitle, for: .normal)
            quizBnt.setTitle(textLib.alphabetScreen.quizBntTitle, for: .normal)
            allCardsBnt.setTitle(textLib.alphabetScreen.showAllBntTitle, for: .normal)
            
            learnBnt.backgroundColor = kAlphabetColor
            quizBnt.backgroundColor = kQuizBntColor
            allCardsBnt.backgroundColor = kAllCardsBntColor
        } else {
            headerLabel.text = textLib.vowelScreen.headerLabel
            learnBnt.setTitle(textLib.vowelScreen.learnBntTitle, for: .normal)
            quizBnt.setTitle(textLib.vowelScreen.quizBntTitle, for: .normal)
            allCardsBnt.setTitle(textLib.vowelScreen.showAllBntTitle, for: .normal)
            
            learnBnt.backgroundColor = kAlphabetColor
            quizBnt.backgroundColor = kQuizBntColor
            allCardsBnt.backgroundColor = kAllCardsBntColor
        }
        
        navigationItem.title = textLib.alphabetScreen.navigationTitle
        parentView.backgroundColor = textLib.alphabetScreen.parentViewBackground
        
        gFunction.setCornerRadius(Bnt: learnBnt, cornerRaddius: kButtonCornerRaddius)
        gFunction.setCornerRadius(Bnt: quizBnt, cornerRaddius: kButtonCornerRaddius)
        
        gFunction.setMenuButtonCornerRadius(Bnt: learnBnt)
        gFunction.setMenuButtonCornerRadius(Bnt: quizBnt)
        gFunction.setMenuButtonCornerRadius(Bnt: allCardsBnt)
    }
}
