//
//  QuizResultViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-02.
//

import UIKit

class QuizResultViewController: UIViewController {

    @IBOutlet weak var youScore: UILabel!
    // MARK: - Vars
    var quizBrain = QuizBrain()
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getYourScore() 
        // Do any additional setup after loading the view.
    }
     
    @IBAction func playAgainBntPress(_ sender: UIButton) {
//        let story = UIStoryboard(name: "Main", bundle:nil)
//        let vc = story.instantiateViewController(withIdentifier: "QuizVC")
//        navigationController?.pushViewController(vc, animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func learnAlphabetBntPress(_ sender: UIButton) {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "AlphabetVC") 
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getYourScore() {
        youScore.text = " \(score) from \(kMaxQuiz)"
    }
    
}
