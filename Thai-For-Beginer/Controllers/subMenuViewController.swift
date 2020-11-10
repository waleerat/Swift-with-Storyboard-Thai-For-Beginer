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
    
    var quizType: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    @IBAction func goToHomeMenu(_ sender: UIButton) {
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "HomeVC")
    }
    
    @IBAction func goToLearnPress(_ sender: UIButton) {
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "\(quizType!)CardVC")
    }
    
    @IBAction func goToShowAllCards(_ sender: UIButton) {
        GlobalFunction().gotoStoryboardWithIdentifier(quizType: quizType , identifier: "ShowAllCardVC")
    }
    
    @IBAction func goToTestPress(_ sender: UIButton) {
        GlobalFunction().gotoStoryboardWithIdentifier(quizType: quizType, identifier: "QuizVC")
    }
    
    private func setTheme(){
        if let quizType = quizType {
            if quizType == "Alphabet" {
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
        } else {
            headerLabel.text = textLib.alphabetScreen.headerLabel
            learnBnt.setTitle(textLib.alphabetScreen.learnBntTitle, for: .normal)
            quizBnt.setTitle(textLib.alphabetScreen.quizBntTitle, for: .normal)
            allCardsBnt.setTitle(textLib.alphabetScreen.showAllBntTitle, for: .normal)
            
            learnBnt.backgroundColor = kAlphabetColor
            quizBnt.backgroundColor = kQuizBntColor
            allCardsBnt.backgroundColor = kAllCardsBntColor
        } 
        
        navigationItem.title = textLib.alphabetScreen.navigationTitle
        parentView.backgroundColor = textLib.alphabetScreen.parentViewBackground
        
        GlobalFunction().setCornerRadius(Bnt: learnBnt, cornerRaddius: kButtonCornerRaddius)
        GlobalFunction().setCornerRadius(Bnt: quizBnt, cornerRaddius: kButtonCornerRaddius)
        
        GlobalFunction().setMenuButtonCornerRadius(Bnt: learnBnt)
        GlobalFunction().setMenuButtonCornerRadius(Bnt: quizBnt)
        GlobalFunction().setMenuButtonCornerRadius(Bnt: allCardsBnt)
    }
}
