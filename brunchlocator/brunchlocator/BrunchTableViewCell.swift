//
//  BrunchTableViewCell.swift
//  brunchlocator
//
//  Created by Yuri Karabatov on 17/12/2018.
//  Copyright © 2018 Yuri Karabatov. All rights reserved.
//

import UIKit

final class BrunchTableViewCell: UITableViewCell {
    @IBOutlet private var topContainer: UIView!
    @IBOutlet private var cafeImageView: UIImageView!
    @IBOutlet private var cafeName: UILabel!
    @IBOutlet private var cafeDescription: UILabel!
    @IBOutlet private var cafeDistance: UILabel!

    @IBOutlet private var bottomContainer: UIView!
    @IBOutlet private var cafeReview: UILabel!

    func configure(cafe: Cafe) {

    }

    func configure(grayedOut: Bool, expanded: Bool) {

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        configure(grayedOut: false, expanded: false)
    }
}
