//
//  ViewController.swift
//  Manga-table-view
//
//  Created by Thien Vu Le on Sep/17/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let titleArray  = ["No game no life", "Attack on titans", "Slam dunk", "Konosuba", "Haikyuu"]
    
    let authorArray = ["aaa", "bbb", "ccc", "ddd", "eee"]
    
    let coverArray = [#imageLiteral(resourceName: "nogamenolife"), #imageLiteral(resourceName: "attack"), #imageLiteral(resourceName: "slamdunk"), #imageLiteral(resourceName: "KonoSuba"), #imageLiteral(resourceName: "haikyuu")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
//        let image = coverArray[indexPath.row]
//        cell.coverManga.image = image
        cell.titleManga = titleArray
        cell.authorManga = authorArray
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

