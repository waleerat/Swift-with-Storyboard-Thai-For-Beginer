//
//  ShowAllCardCollectionViewCell.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-05.
//

import UIKit
import AVFoundation

class ShowAllCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageBnt: UIButton!
    var currentPlay: String!
    var player: AVAudioPlayer?
    
    var gFunction = GlobalFunction()
     
    
    func setCollection(cardModel: [String:String]){
        gFunction.setCornerRadius(Bnt: imageBnt, cornerRaddius: 10)
        if let code = cardModel["code"] {
            gFunction.setButtonBgImage(Bnt: self.imageBnt, UIImageNamed: code)
            currentPlay = code
        }
    }
    
    @IBAction func imageBntPress(_ sender: UIButton) {
        gFunction.setButtonAnimate(Bnt: sender)
        if let currentPlay = currentPlay {
            PlaySound(currentPlay: currentPlay)
        }
    }
    
    private func PlaySound(currentPlay: String!){
        let url = Bundle.main.url(forResource: currentPlay, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}

