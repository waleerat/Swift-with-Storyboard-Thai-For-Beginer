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
     
    
    func setCollection(cardModel: [String:String]){
        GlobalFunction().setCornerRadius(Bnt: imageBnt, cornerRaddius: 10)
        if let code = cardModel["code"] {
            GlobalFunction().setButtonBgImage(Bnt: self.imageBnt, UIImageNamed: code)
            currentPlay = code
        }
    }
    
    @IBAction func imageBntPress(_ sender: UIButton) {
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
