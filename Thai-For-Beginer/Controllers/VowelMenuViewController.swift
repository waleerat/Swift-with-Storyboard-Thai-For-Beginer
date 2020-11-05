//
//  VowelMenuViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-04.
//

import UIKit

class VowelMenuViewController: UIViewController {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var learnBnt: UIButton!
    @IBOutlet weak var quizBnt: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        setTheme()
        
    }
    
    @IBAction func goToHomeMenu(_ sender: UIButton) {
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "HomeVC")
    }
     
    @IBAction func goToLearnPress(_ sender: UIButton) {
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "VowelCardVC")
    }
    
    @IBAction func goToTestPress(_ sender: UIButton) {
        //GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "VowelQuizVC")
        GlobalFunction().gotoQuizStoryboard(quizType: "Vowel")
    }
     
    
    private func setTheme(){
        navigationItem.title = textLib.vowelScreen.navigationTitle
        parentView.backgroundColor = textLib.vowelScreen.parentViewBackground
        headerLabel.text = textLib.vowelScreen.headerLabel
        learnBnt.setTitle(textLib.vowelScreen.learnBntTitle, for: .normal)
        quizBnt.setTitle(textLib.vowelScreen.quizBntTitle, for: .normal)
        
        learnBnt.backgroundColor = kVowelColor
        quizBnt.backgroundColor = kQuizBntColor
        
        GlobalFunction().setCornerRadius(Bnt: learnBnt, cornerRaddius: kButtonCornerRaddius)
        GlobalFunction().setCornerRadius(Bnt: quizBnt, cornerRaddius: kButtonCornerRaddius)
        
        GlobalFunction().setMenuButtonCornerRadius(Bnt: learnBnt)
        GlobalFunction().setMenuButtonCornerRadius(Bnt: quizBnt)
    }

}
