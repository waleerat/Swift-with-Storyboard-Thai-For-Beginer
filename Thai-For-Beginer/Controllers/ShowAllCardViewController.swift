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
    
    
    private var cardModels: [[String:String]] = []
        var selectedItem: Any?
    
    var gFunction = GlobalFunction()
    var DivFrameWidth = 2.02
    var DivFrameHeight = 3
   
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        getCurrentScreenView()
        collectionView.reloadData()
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAlphabetsCard()
        // Do any additional setup after loading the view.
        setTheme()
     }
    
    override func viewDidAppear(_ animated: Bool) {
        getCurrentScreenView()
        collectionView.reloadData()
    }
     
    @IBAction func goBackToMenu(_ sender: UIButton) {
        gFunction.gotoStoryboardWithIdentifier(quizType: kCurrentScreen , identifier: "SubMenuVC")
    }
    
     func loadAlphabetsCard(){
        if (kCurrentScreen == "Alphabet") {
            for (item) in AlphabetRows {
                cardModels.append(
                [
                    "quizType" : kCurrentScreen,
                    "code": item[0],
                    "thaiName": item[2]
                ]
                )
            }
        } else {
            for (item) in vowelRows {
                cardModels.append(
                [
                    "quizType" : kCurrentScreen,
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
            
            //getCurrentScreenView()
            //print("FrameWidth : \(DivFrameWidth)   FrameHeight : \(DivFrameHeight)")
             
            return CGSize(width: collectionView.frame.width/CGFloat(DivFrameWidth), height: collectionView.frame.height/CGFloat(DivFrameHeight))
        }
        
        private func setTheme(){
            if (kCurrentScreen == "Alphabet") {
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
        
        
        private func getCurrentScreenView(){
            
            print("** CHECK ORIENTATION")
            if(UIDevice.current.orientation.isLandscape)
            {
                print("** LANDSCAPE")
            }
            if(UIDevice.current.orientation.isPortrait)
            {
                print("** PORTRAIT")
            }
            if(UIDevice.current.orientation.isFlat)
            {
                print("** FLAT")
            }
            
            
            if UIDevice.current.orientation.isLandscape {
                print("Landscape")
                switch UIDevice.current.userInterfaceIdiom {
                case .pad:
                    DivFrameWidth = 5.04
                    DivFrameHeight = 2
                case .phone,.unspecified,.tv,.carPlay,.mac:
                    DivFrameWidth = 2.02
                    DivFrameHeight = 3
                @unknown default:
                    return
                }
            } else {
                print("Portrait")
                switch UIDevice.current.userInterfaceIdiom {
                case .pad:
                    DivFrameWidth = 4.04
                    DivFrameHeight = 3
                case .phone,.unspecified,.tv,.carPlay,.mac:
                    DivFrameWidth = 2.02
                    DivFrameHeight = 3
                @unknown default:
                    return
                }
            }
            
             
        }
        
    }

      
