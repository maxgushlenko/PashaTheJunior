//
//  CustomCell.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 4/18/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

let CustomCellIdentifier = "CustomCell"

class CustomCell: UITableViewCell {

    @IBOutlet weak var thubnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!

    var belaz: Belaz? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        thubnailImageView.layer.cornerRadius = 30.0
        thubnailImageView.clipsToBounds = true
    }

    func updateUI() {
        guard let belaz = belaz else {
            return
        }

        nameLabel.text = belaz.name
        typeLabel.text = belaz.type.rawValue
        capacityLabel.text = "\(belaz.capacity)"
        thubnailImageView.image = belaz.image
    }

}
