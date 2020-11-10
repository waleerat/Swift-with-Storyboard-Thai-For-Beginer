//
//  TestViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-05.
//

//security lock-keychain LeeSkeychain.keychain
//security unlock-keychain -p 45ogzypX LeeSkeychain.keychain

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var cellImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setup(image: UIImage)  {
        UIView.transition(with: cellImage, duration: 0.3, options: .transitionCurlDown) {
            self.cellImage.image = image
        }
    }

    @IBAction func reloadImagePress(_ sender: UIButton) {
    //setup(image: )
    }
}
