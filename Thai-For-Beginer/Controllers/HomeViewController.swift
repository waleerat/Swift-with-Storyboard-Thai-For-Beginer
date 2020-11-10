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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setTheme()
    }
     
    @IBAction func goToAlphabetMenuPress(_ sender: UIButton) {
        kCurrentScreen = "alphabet"
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "AlphabetMenuVC")
    }
    
    @IBAction func goToVowelMenuPress(_ sender: UIButton) {
        kCurrentScreen = "vowel"
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "VowelMenuVC")
    }
    
    @IBAction func goToSettingPress(_ sender: UIButton) {
        GlobalFunction().gotoStoryboard(storyboard : "Main", identifier : "SettingVC")
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
        
        GlobalFunction().setCornerRadius(Bnt: alphabetBnt, cornerRaddius: kButtonCornerRaddius)
        GlobalFunction().setCornerRadius(Bnt: vowelBnt, cornerRaddius: kButtonCornerRaddius)
        //GlobalFunction().setCornerRadius(Bnt: settingBnt, cornerRaddius: kButtonCornerRaddius)
        
        GlobalFunction().setMenuButtonCornerRadius(Bnt: alphabetBnt)
        GlobalFunction().setMenuButtonCornerRadius(Bnt: vowelBnt)
        //GlobalFunction().setMenuButtonCornerRadius(Bnt: settingBnt)
    }
}
 

//let story = UIStoryboard(name: "Main", bundle:nil)
//let viewController = story.instantiateViewController(withIdentifier: "AlphabetMenuVC")
////viewController.hidesBottomBarWhenPushed = true
//navigationController?.pushViewController(viewController, animated: true)
////UIApplication.shared.windows.first?.rootViewController = vc
