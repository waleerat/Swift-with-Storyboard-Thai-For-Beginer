//
//  AlphabetQuizViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-03.
//

import UIKit
import AVFoundation
import SCLAlertView

class QuizViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var loadNextQuizBnt: UIButton!
    @IBOutlet weak var homeBnt: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var choice01Bnt: UIButton!
    @IBOutlet weak var choice02Bnt: UIButton!
    @IBOutlet weak var choice03Bnt: UIButton!
    @IBOutlet weak var choice04Bnt: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    // MARK: - Vars
    
     
    var quizNumberOfRows: Int!
    var quizData: [[String]]!
    
    var quizSoundCode: String!
    var player: AVAudioPlayer?
    var quizChoices: [Int]!
    var selectedChoice: Int!
    var quizAnswer: Int!
    var editingMode = false
    
    var quizBrain = QuizBrain()
    var gFunction = GlobalFunction()
    
    let appearance = SCLAlertView.SCLAppearance(
        showCloseButton: false
    )
    
    override public var shouldAutorotate: Bool {
        return false
      }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getQuizData()
        setTheme()
        quizBrain.resetQuiz()
        loadNextQuiz()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBAction
    @IBAction func goToSubMenu(_ sender: UIButton) {
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen , identifier: "SubMenuVC")
    }
    
    @IBAction func playSoundBntPress(_ sender: UIButton) {
        if let quizSoundCode = quizSoundCode {
            PlaySound(currentPlay: quizSoundCode)
        }
    }
    //selectedChoice is index of array start at 0
    @IBAction func choice01Press(_ sender: UIButton) {
        checkAnswer(Buttonpressed: sender, selectedChoice: 0)
    }
    
    @IBAction func choice02Press(_ sender: UIButton) {
        checkAnswer(Buttonpressed: sender, selectedChoice: 1)
    }
    
    @IBAction func choice03Press(_ sender: UIButton) {
        checkAnswer(Buttonpressed: sender, selectedChoice: 2)
    }
    
    @IBAction func choice04Press(_ sender: UIButton) {
        checkAnswer(Buttonpressed: sender, selectedChoice: 3)
    }
    
    private func getQuizData(){
        if kCurrentScreen == "Alphabet" {
            quizData = AlphabetRows
            quizNumberOfRows = 44
        } else {
            quizData = vowelRows
            quizNumberOfRows = 32
        }
    }
    
    private func loadNextQuiz(){
       
        if (quizBrain.questionNumber < kMaxQuiz) {
            quizBrain.quizCounter()
            randomQuiz()
            QuizProgress()
        } else {
            editingMode = false
            updateEditingMode()
            gFunction.showScore(score: quizBrain.score, quizType: kCurrentScreen)
            
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "QuizResultVC") as! QuizResultViewController
            vc.yourScore = quizBrain.score
            UIApplication.shared.windows.first?.rootViewController = vc
        }
    } 

    private func randomQuiz(){
       
        quizBrain.getQuiz(numberOfRows: quizNumberOfRows) { (quizChoices, quizAnswer) in
            var code = ""
            self.quizAnswer = quizAnswer
            self.quizChoices = quizChoices
            self.quizSoundCode = self.quizData[quizAnswer][0]
            
            for (index, alphabetOrder) in quizChoices.enumerated() {
                code = self.quizData[alphabetOrder][0]
                switch index + 1 {
                case 1:
                    self.gFunction.setButtonBgImage(Bnt: self.choice01Bnt, UIImageNamed: code)
                case 2:
                    self.gFunction.setButtonBgImage(Bnt: self.choice02Bnt, UIImageNamed: code)
                case 3:
                    self.gFunction.setButtonBgImage(Bnt: self.choice03Bnt, UIImageNamed: code)
                case 4:
                    self.gFunction.setButtonBgImage(Bnt: self.choice04Bnt, UIImageNamed: code)
                default :
                    print("No case")
                }
            }
            
            self.editingMode = true
            self.updateEditingMode()
            self.PlaySoundDelay()
        } 
    }
    
    private func QuizProgress(){
        progressBar.progress = quizBrain.getProgress()
        getProgressText()
    }
    
    private func PlaySoundDelay(){
        Timer.scheduledTimer(withTimeInterval: kPlaySoundDelay , repeats: false) { (timer) in
            if let quizSoundCode = self.quizSoundCode {
                self.PlaySound(currentPlay: quizSoundCode)
            }
        }
    }
    // MARK: - Check Answer
    private func checkAnswer(Buttonpressed: UIButton , selectedChoice: Int){
        var alphabetCode = ""
        let selected = quizData[quizChoices[selectedChoice]][0]
        let answer = quizData[quizAnswer][0]
        
        
        for (index, alphabetOrder) in quizChoices.enumerated() {
            alphabetCode = quizData[alphabetOrder][0]
            
            if (answer == alphabetCode) {
                switch index + 1 {
                case 1:
                    gFunction.setButtonBoderCorrect(Bnt: choice01Bnt)
                    gFunction.setButtonAnimate(Bnt: choice01Bnt)
                case 2:
                    gFunction.setButtonBoderCorrect(Bnt: choice02Bnt)
                    gFunction.setButtonAnimate(Bnt: choice02Bnt)
                case 3:
                    gFunction.setButtonBoderCorrect(Bnt: choice03Bnt)
                    gFunction.setButtonAnimate(Bnt: choice03Bnt)
                case 4:
                    gFunction.setButtonBoderCorrect(Bnt: choice04Bnt)
                    gFunction.setButtonAnimate(Bnt: choice04Bnt)
                default:
                    return
                }
            }
        }
         
        if (selected == answer) {
            quizBrain.score += 1
            PlaySound(currentPlay: "sound-correct")
        } else {
            PlaySound(currentPlay: "sound-incorrect1")
            gFunction.setButtonBoderIncorrect(Bnt: Buttonpressed)
        }
        
        editingMode = false
        updateEditingMode()
        
        Timer.scheduledTimer(withTimeInterval: kNextQuesionDelay , repeats: false) { (timer) in
            self.loadNextQuiz()
        }
    } 
    
    //MARK: - helper
    private func updateEditingMode() {
        choice01Bnt.isUserInteractionEnabled = editingMode
        choice02Bnt.isUserInteractionEnabled = editingMode
        choice03Bnt.isUserInteractionEnabled = editingMode
        choice04Bnt.isUserInteractionEnabled = editingMode
        loadNextQuizBnt.isUserInteractionEnabled = editingMode
    }
    
    private func PlaySound(currentPlay: String!){
        let userDefaults = UserDefaults.standard
        var isPlay = true
        
        if let isCorrectSound = userDefaults.value(forKey: "isCorrectSound") {
                isPlay = isCorrectSound as! Bool
        }
        
        if isPlay {
            let url = Bundle.main.url(forResource: currentPlay, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
    }
    
    private func getProgressText(){
        progressLabel.text = " \(quizBrain.questionNumber) / \(kMaxQuiz)"
    }

    
    private func setTheme(){
        if kCurrentScreen == "Alphabet" {
            homeBnt.setImage(UIImage(named: "icon-alphabet"), for: .normal)
            navigationItem.title = textLib.AlphabetQuizScreen.navigationTitle
            headerLabel.text = textLib.AlphabetQuizScreen.headerLabel
            parentView.backgroundColor = textLib.AlphabetQuizScreen.parentViewBackground
        } else {
            homeBnt.setImage(UIImage(named: "icon-vowel"), for: .normal)
            navigationItem.title = textLib.vowelScreen.navigationTitle
            headerLabel.text = textLib.vowelScreen.headerLabel
            parentView.backgroundColor = textLib.vowelScreen.parentViewBackground
        }
        headerLabel.textColor = kHeaderLabelColor
        
    }
        
}
