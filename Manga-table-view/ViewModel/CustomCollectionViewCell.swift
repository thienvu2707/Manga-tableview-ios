//
//  CustomCollectionViewCell.swift
//  Manga-table-view
//
//  Created by Thien Vu Le on Sep/17/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    var titleManga : [String] = [] {
        didSet{
//            tableView.delegate = self
            tableView.dataSource = self
            tableView.reloadData()
        }
    }
    
    var authorManga: [String] = [] {
        didSet {
//            tableView.delegate = self
            tableView.dataSource = self
//            tableView.reloadData()
        }
    }
    
    let coverArray = [#imageLiteral(resourceName: "nogamenolife"), #imageLiteral(resourceName: "attack"), #imageLiteral(resourceName: "slamdunk"), #imageLiteral(resourceName: "KonoSuba"), #imageLiteral(resourceName: "haikyuu")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = 100
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tableView.dataSource = self
    }
}

//extension CustomCollectionViewCell: UITableViewDelegate{
//
//}

extension CustomCollectionViewCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleManga.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let image = coverArray[indexPath.row]
        cell.coverView.image = image
        cell.titleLabel.text = titleManga[indexPath.row]
        cell.authorLabel.text = authorManga[indexPath.row]
        return cell
    }
}
