//
//  HomeViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-04.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alphabetBnt: UIButton!
    @IBOutlet weak var vowelBnt: UIButton!
    @IBOutlet weak var settingBnt: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    var gFunction = GlobalFunction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setTheme()
    }
     
    @IBAction func goToAlphabetMenuPress(_ sender: UIButton) {
        kCurrentScreen = "Alphabet"
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen , identifier: "SubMenuVC")
    }
    
    @IBAction func goToVowelMenuPress(_ sender: UIButton) {
        kCurrentScreen = "Vowel"
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen , identifier: "SubMenuVC")
    }
    
    @IBAction func goToSettingPress(_ sender: UIButton) {
        gFunction.gotoStoryboard(storyboard : "Main", identifier : "SettingVC")
    }
    
    private func setTheme(){
        navigationItem.title = textLib.homeScreen.navigationTitle
        parentView.backgroundColor = textLib.homeScreen.parentViewBackground
        headerLabel.text = textLib.homeScreen.headerLabel
        alphabetBnt.setTitle(textLib.homeScreen.alphabetBntTitle, for: .normal)
        vowelBnt.setTitle(textLib.homeScreen.vowelBntTitle, for: .normal)
        //settingBnt.setTitle(textLib.homeScreen.settingBntTitle, for: .normal)
        
        alphabetBnt.backgroundColor = kAlphabetColor
        vowelBnt.backgroundColor = kVowelColor
        //settingBnt.backgroundColor = kSettingColor
        
        gFunction.setCornerRadius(Bnt: alphabetBnt, cornerRaddius: kButtonCornerRaddius)
        gFunction.setCornerRadius(Bnt: vowelBnt, cornerRaddius: kButtonCornerRaddius)
        //gFunction.setCornerRadius(Bnt: settingBnt, cornerRaddius: kButtonCornerRaddius)
        
        gFunction.setMenuButtonCornerRadius(Bnt: alphabetBnt)
        gFunction.setMenuButtonCornerRadius(Bnt: vowelBnt)
        //gFunction.setMenuButtonCornerRadius(Bnt: settingBnt)
    }
}
 

//let story = UIStoryboard(name: "Main", bundle:nil)
//let viewController = story.instantiateViewController(withIdentifier: "AlphabetMenuVC")
////viewController.hidesBottomBarWhenPushed = true
//navigationController?.pushViewController(viewController, animated: true)
////UIApplication.shared.windows.first?.rootViewController = vc
