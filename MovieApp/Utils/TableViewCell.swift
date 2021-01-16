//
//  TableViewCell.swift
//  MovieApp
//
//  Created by mac on 15/01/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    var item: Any? {
        didSet {
            self.configure(self.item)
        }
    }
    
    weak var delegate: NSObjectProtocol? = nil
    
    func configure(_ item: Any?) { }
    
}
