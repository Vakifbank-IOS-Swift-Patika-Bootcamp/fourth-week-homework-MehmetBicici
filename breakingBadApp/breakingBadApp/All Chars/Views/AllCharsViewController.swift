//
//  AllCharsViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import UIKit

class AllCharsViewController: BaseViewController {
    
    private let viewModel = AllCharsViewModel()
    var emptyData: [ListOfAllCharsModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "AllCharsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "charCell")
        
        viewModel.getData {
            self.emptyData = self.viewModel.setData()
            self.indicator.stopAnimating()
            self.showAlertForAllChars()
        }
        
    }
    
}


 extension AllCharsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return viewModel.getCountOfData()
     }
     func numberOfSections(in collectionView: UICollectionView) -> Int {
         1
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "charCell", for: indexPath) as? AllCharsCollectionViewCell else { return UICollectionViewCell() }
         cell.setup(model: viewModel.getModel(atIndex: indexPath.row))
         return cell
     }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let selectedCharId = viewModel.getId(atIndex: indexPath.row)
         let vc = CharDetailsViewController(nibName: "CharDetailsViewController", bundle: nil)
         vc.setId(id: selectedCharId)
         self.present(vc, animated: true, completion: nil)
     }
     
 }

