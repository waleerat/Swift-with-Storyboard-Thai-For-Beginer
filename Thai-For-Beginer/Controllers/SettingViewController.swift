//
//  SettingViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-04.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alphabetSoundLabel: UILabel!
    @IBOutlet weak var vowelSoundLabel: UILabel!
    @IBOutlet weak var correctSoundLable: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var isAlphabetSound: UISwitch!
    @IBOutlet weak var isVowelSound: UISwitch!
    @IBOutlet weak var isCorrectSound: UISwitch!
    @IBOutlet weak var setDefaultBnt: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    var gFunction = GlobalFunction()
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        setTheme()
        loadSetting()
    }
    
    @IBAction func goToHomeMenu(_ sender: UIButton) {
        gFunction.gotoStoryboard(storyboard : "Main", identifier : "HomeVC")
    }
 
    @IBAction func isAlphabetSound(_ sender: UISwitch) {
        let isOn = (sender.isOn) ? true : false
        saveUserDefault(isOn: isOn, setForKey: "isAlphabetSound")
    }
    
    @IBAction func isVowelSound(_ sender: UISwitch) {
        let isOn = (sender.isOn) ? true : false
        saveUserDefault(isOn: isOn, setForKey: "isVowelSound")
    }
    
    @IBAction func isCorrectSound(_ sender: UISwitch) {
        let isOn = (sender.isOn) ? true : false
        saveUserDefault(isOn: isOn, setForKey: "isCorrectSound")
    }
    
    @IBAction func setDefaultBntPress(_ sender: UIButton) {
        let isOn = true
        saveUserDefault(isOn: isOn, setForKey: "isAlphabetSound")
        saveUserDefault(isOn: isOn, setForKey: "isVowelSound")
        saveUserDefault(isOn: isOn, setForKey: "isCorrectSound")
        loadSetting()
    }
    
    private func loadSetting(){
        setSwichBnt(swichBnt: isAlphabetSound, setForKey: "isAlphabetSound")
        setSwichBnt(swichBnt: isVowelSound, setForKey: "isVowelSound")
        setSwichBnt(swichBnt: isCorrectSound, setForKey: "isCorrectSound")
    }
    
    private func setTheme(){
        navigationItem.title = textLib.settingScreen.navigationTitle
        parentView.backgroundColor = textLib.settingScreen.parentViewBackground
        headerLabel.text = textLib.settingScreen.headerLabel
        
        alphabetSoundLabel.text = textLib.settingScreen.alphabetSoundLabel
        vowelSoundLabel.text = textLib.settingScreen.vowelSoundLabel
        correctSoundLable.text = textLib.settingScreen.correctSoundLable
        
        setDefaultBnt.setTitle(textLib.settingScreen.setDefaultBntTitle, for: .normal)
        setDefaultBnt.backgroundColor = kSettingColor
        gFunction.setCornerRadius(Bnt: setDefaultBnt, cornerRaddius: kButtonCornerRaddius)
        gFunction.setMenuButtonCornerRadius(Bnt: setDefaultBnt)
         
    }
    
    // MARK: - help
    private func saveUserDefault(isOn: Bool, setForKey: String){
        userDefaults.setValue(isOn , forKey: setForKey)
        userDefaults.synchronize()
    }
    
    private func setSwichBnt(swichBnt: UISwitch, setForKey: String){
        var isCorrectSoundOn = true
        if let isCorrectSound = userDefaults.value(forKey: setForKey) {
            isCorrectSoundOn = isCorrectSound as! Bool
        } else {
            saveUserDefault(isOn: true , setForKey: setForKey)
        }
        swichBnt.setOn(isCorrectSoundOn, animated: true)
    }
 
}


//userDefaults.removeObject(forKey: kCURRENTUSER)
//userDefaults.synchronize()
