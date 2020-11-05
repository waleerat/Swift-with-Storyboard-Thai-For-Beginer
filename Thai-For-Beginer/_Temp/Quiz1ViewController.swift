//
//  ViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-10-31.
//

import UIKit
import AVFoundation

class Quiz1ViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var choice00: UIImageView!
    @IBOutlet weak var choice01: UIImageView!
    @IBOutlet weak var choice02: UIImageView!
    @IBOutlet weak var choice03: UIImageView!
    @IBOutlet weak var ProgressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var loadNextQuizBnt: UIButton!
    
    @IBOutlet weak var choice00Bnt: UIButton!
    @IBOutlet weak var choice01Bnt: UIButton!
    @IBOutlet weak var choice02Bnt: UIButton!
    @IBOutlet weak var choice03Bnt: UIButton!
    
    // MARK: - Vars
    var quizSoundCode: String!
    var player: AVAudioPlayer?
    var quizChoices: [Int]!
    var selectedChoice: Int!
    var quizAnswer: Int!
    var editingMode = false
    
    var quizBrain = QuizBrain()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        quizBrain.resetQuiz()
        loadNextQuiz()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //quizBrain.resetQuiz()
        //loadNextQuiz()
        
    }
  
    @IBAction func gotoNextQuiz(_ sender: UIButton) {
        loadNextQuiz()
    }
    
    @IBAction func playSoundBntPress(_ sender: UIButton) {
        if let quizSoundCode = quizSoundCode {
            PlaySound(currentPlay: quizSoundCode)
        }
    }
    
    @IBAction func choice00Press(_ sender: UIButton) {
        checkAnswer(selectedChoice: 0)
    }
    
    @IBAction func choice01Press(_ sender: UIButton) {
        checkAnswer(selectedChoice: 1)
    }
    
    @IBAction func choice02Press(_ sender: UIButton) {
        checkAnswer(selectedChoice: 2)
    }
    
    @IBAction func choice03Press(_ sender: UIButton) {
        checkAnswer(selectedChoice: 3)
    }
    
    private func checkAnswer(selectedChoice: Int){
        let selected = AlphabetRows[quizChoices[selectedChoice]][0]
        let answer = AlphabetRows[quizAnswer][0]
         
        if (selected == answer) {
            quizBrain.score += 1
            ProgressLabel.textColor = .blue
            
        } else {
            ProgressLabel.textColor = .red
        }
        
        editingMode = false
        updateEditingMode()
        
        Timer.scheduledTimer(withTimeInterval: kNextQuesionDelay , repeats: false) { (timer) in
            self.loadNextQuiz()
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
            print("Game Finish")
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "QuizResultVC") as! QuizResultViewController
            vc.score = quizBrain.score
            //present(vc, animated: true, completion: nil)
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    func setButtonBgImage(Bnt: UIButton , UIImageNamed : String) {
        Bnt.setBackgroundImage(UIImage(named: UIImageNamed), for: .normal)
        Bnt.isSelected = (UIImageNamed == "checkbox-checked") ?  true : false
    }
    
    private func randomQuiz(){
        var code = ""
        quizChoices = []
        quizChoices = (0...43).randomElements(4)
        quizAnswer = quizChoices.randomElement()!
        
        quizSoundCode = AlphabetRows[quizAnswer][0]
        
        for (index, alphabetOrder) in quizChoices.enumerated() {
            code = AlphabetRows[alphabetOrder][0]
            switch index {
            case 0:
                choice00.image = UIImage(named: code)
            case 1:
                choice01.image = UIImage(named: code)
            case 2:
                choice02.image = UIImage(named: code)
            case 3:
                choice03.image = UIImage(named: code)
            default:
                print("not in switch case")
            }
        }
        
        editingMode = true
        updateEditingMode()
        PlaySoundDelay()
        
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
    
    private func PlaySound(currentPlay: String!){
        let url = Bundle.main.url(forResource: currentPlay, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    //MARK: - Editing Mode
    private func updateEditingMode() {
        choice00Bnt.isUserInteractionEnabled = editingMode
        choice01Bnt.isUserInteractionEnabled = editingMode
        choice02Bnt.isUserInteractionEnabled = editingMode
        choice03Bnt.isUserInteractionEnabled = editingMode
        loadNextQuizBnt.isUserInteractionEnabled = editingMode
    }
    
    private func getProgressText(){
        ProgressLabel.text = " \(quizBrain.questionNumber) / \(kMaxQuiz)"
    }
     
     
}

//func goToChat(userObject : userModel!) {
//
//    if let uObject = userObject {
//        let chatRoomId = startChat(user1: userModel.currentUser()!, user2: uObject)
//        let chatView = ChatViewController(chatId: chatRoomId, recipientId: uObject.objectId, recipientName: uObject.username)
//
//        chatView.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(chatView, animated: true)
//    }
//
//
//}

//    func showMatchViewScreenFromSearchViewCell(userObject: userModel?) {
//        let story = UIStoryboard(name: NavgationHelper.MatchViewScreen.StoryboardName, bundle:nil)
//        let vc = story.instantiateViewController(withIdentifier: NavgationHelper.MatchViewScreen.ControllerIdentifier) as! MatchViewController
//        vc.userObject = userObject
//
//        present(vc, animated: true, completion: nil)
//    }
