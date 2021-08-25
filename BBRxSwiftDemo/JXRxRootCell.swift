//
//  JXRxRootCell.swift
//  BBRxSwiftDemo
//
//  Created by SJXC on 2021/8/25.
//

import UIKit

class JXRxRootCell: UITableViewCell {
    @IBOutlet weak var lb1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(model: DemoModel?) {
        if let mod = model {
            self.lb1.text = "firstKey \(mod.firstKey), secondKey \(mod.secondKey)"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
