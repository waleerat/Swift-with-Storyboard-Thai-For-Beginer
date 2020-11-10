//
//  ShowAllAlphabetViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-05.
//

import UIKit

class ShowAllCardViewController: UIViewController {
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var homeBnt: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    enum UIUserInterfaceIdiom : Int {
        case unspecified
        case phone // iPhone and iPod touch style UI
        case pad   // iPad style UI (also includes macOS Catalyst)
    }
    
    var quizType: String!
    private var cardModels: [[String:String]] = []
        var selectedItem: Any?
      
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAlphabetsCard()
        // Do any additional setup after loading the view.
        setTheme()
     }
    
     
    @IBAction func goBackToMenu(_ sender: UIButton) {
        GlobalFunction().gotoStoryboardWithIdentifier(quizType: quizType , identifier: "SubMenuVC")
    }
    
    
     func loadAlphabetsCard(){
        if (quizType == "Alphabet") {
            for (item) in AlphabetRows {
                cardModels.append(
                [
                    "quizType" : quizType,
                    "code": item[0],
                    "thaiName": item[2]
                ]
                )
            }
        } else {
            for (item) in vowelRows {
                cardModels.append(
                [
                    "quizType" : quizType,
                    "code": item[0],
                    "nameInThai": item[1]
                ]
                )
            }
        }
        
    }
    }


    extension ShowAllCardViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return cardModels.count  // form Models/filebase/country.swift
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ShowAllCardCollectionViewCell
            //cell.continentLabel.text = cardModels[indexPath.row]["code"]
            cell.setCollection(cardModel: cardModels[indexPath.row])
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // columns
            var DivFrameWidth = 2.02
            switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                DivFrameWidth = 3.04
            case .phone,.unspecified,.tv,.carPlay,.mac:
                DivFrameWidth = 2.02
            @unknown default:
                DivFrameWidth = 2.02
            }
            
            return CGSize(width: collectionView.frame.width/CGFloat(DivFrameWidth), height: collectionView.frame.height/3)
        }
        
        private func setTheme(){
            if (quizType == "Alphabet") {
                headerLabel.text = textLib.AlphabetListAllScreen.headerLabel
                homeBnt.setImage(UIImage(named: "icon-alphabet"), for: .normal)
                parentView.backgroundColor = textLib.AlphabetQuizScreen.parentViewBackground
                collectionView.backgroundColor = textLib.AlphabetQuizScreen.parentViewBackground
            } else {
                headerLabel.text = textLib.VowelListAllScreen.headerLabel
                homeBnt.setImage(UIImage(named: "icon-vowel"), for: .normal)
                parentView.backgroundColor = textLib.vowelScreen.parentViewBackground
                collectionView.backgroundColor = textLib.vowelScreen.parentViewBackground
            }
            headerLabel.textColor = kHeaderLabelColor
        }
        
    }

      
