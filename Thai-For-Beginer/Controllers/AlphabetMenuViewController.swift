//
//  AlphabetMenuViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-04.
//

import UIKit

class AlphabetMenuViewController: UIViewController {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var learnBnt: UIButton!
    @IBOutlet weak var quizBnt: UIButton!
    @IBOutlet weak var allCardsBnt: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
    }
    
    @IBAction func goToHomeMenu(_ sender: UIButton) {
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "HomeVC")
    }
    
    
    @IBAction func goToLearnPress(_ sender: UIButton) {
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "AlphabetCardVC")
    }
    
    
    @IBAction func goToShowAllCards(_ sender: UIButton) {
        GlobalFunction().gotoAllCardStoryboard(quizType: "Alphabet")
    }
    
    @IBAction func goToTestPress(_ sender: UIButton) {
        GlobalFunction().gotoQuizStoryboard(quizType: "Alphabet")
    }
    
 
    
    private func setTheme(){
        navigationItem.title = textLib.alphabetScreen.navigationTitle
        parentView.backgroundColor = textLib.alphabetScreen.parentViewBackground
        headerLabel.text = textLib.alphabetScreen.headerLabel
        learnBnt.setTitle(textLib.alphabetScreen.learnBntTitle, for: .normal)
        quizBnt.setTitle(textLib.alphabetScreen.quizBntTitle, for: .normal)
        allCardsBnt.setTitle(textLib.alphabetScreen.showAllBntTitle, for: .normal)
        
        learnBnt.backgroundColor = kAlphabetColor
        quizBnt.backgroundColor = kQuizBntColor
        allCardsBnt.backgroundColor = kAllCardsBntColor
        
        GlobalFunction().setCornerRadius(Bnt: learnBnt, cornerRaddius: kButtonCornerRaddius)
        GlobalFunction().setCornerRadius(Bnt: quizBnt, cornerRaddius: kButtonCornerRaddius)
        
        GlobalFunction().setMenuButtonCornerRadius(Bnt: learnBnt)
        GlobalFunction().setMenuButtonCornerRadius(Bnt: quizBnt)
        GlobalFunction().setMenuButtonCornerRadius(Bnt: allCardsBnt)
        
    }
    
}
