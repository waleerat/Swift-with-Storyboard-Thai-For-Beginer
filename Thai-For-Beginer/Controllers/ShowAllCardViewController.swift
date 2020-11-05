//
//  ShowAllAlphabetViewController.swift
//  Thai-For-Beginer
//
//  Created by Waleerat Gottlieb on 2020-11-05.
//

import UIKit

class ShowAllCardViewController: UIViewController {
 
        struct Continent {
            static let name = ["Asia", "Africa", "North America", "South America", "Antarctica", "Europe"]
        }
    private var cardModels = [AlphabetsCardModel]()
    
    
        var selectedItem: Any?
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "Continent"
            // Do any additional setup after loading the view.
        }
    
    
     func loadAlphabetsCard(){
        var count: Int = 0
        for (item) in AlphabetRows {
            count += 1
            cardModels.append(AlphabetsCardModel(
                                orderNumber: count,
                                        code: item[0],
                                        cardName: item[0],
                                        audioFileName: "\(item[0]).mp3",
                                        symbol: item[1],
                                        thaiName: item[2],
                                        RTGSName: item[3],
                                        meaning: item[4],
                                        RTGSStartSound: item[5],
                                        RTGSEndSound: item[6],
                                        PIAStartSound: item[7],
                                        PIAEndSound: item[8]))
        }
    }
    }


    extension ShowAllCardViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return cardModels.count  // form Models/filebase/country.swift
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)   //as! ContinentCollectionViewCell
          //  cell.continentLabel.text = Continent.name[indexPath.row]
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.height/5)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.selectedItem = Continent.name[indexPath.row]
           // performSegue(withIdentifier: "seguGotoContryScreen", sender: self)
        }
       
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let countryVC = segue.destination as! CountryViewController
//            countryVC.selectedContinent = (selectedItem!) as? String
//        }
        
    }

     
