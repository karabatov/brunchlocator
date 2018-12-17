//
//  BrunchTableViewCell.swift
//  brunchlocator
//
//  Created by Yuri Karabatov on 17/12/2018.
//  Copyright © 2018 Yuri Karabatov. All rights reserved.
//

import UIKit

final class BrunchTableViewCell: UITableViewCell {
    static let reuseIdentifier = "BrunchTableViewCell"

    @IBOutlet private var topContainer: UIView!
    @IBOutlet private var cafeImageView: UIImageView!
    @IBOutlet private var cafeName: UILabel!
    @IBOutlet private var cafeDescription: UILabel!
    @IBOutlet private var cafeDistance: UILabel!

    @IBOutlet private var bottomContainer: UIView!
    @IBOutlet private var cafeReview: UILabel!

    @IBOutlet private var topContainerToViewConstraint: NSLayoutConstraint!
    @IBOutlet private var topContainterToBottomConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()

        cafeImageView.layer.masksToBounds = true
        cafeImageView.layer.cornerRadius = 6.0
    }

    func configure(cafe: Cafe) {
        cafeName.text = cafe.name
        cafeDescription.text = cafe.descr
        cafeDistance.text = cafe.distance
        cafeReview.text = cafe.review
    }

    func configure(grayedOut: Bool, expanded: Bool) {
        if grayedOut {
            topContainer.alpha = 0.7
        } else {
            topContainer.alpha = 1.0
        }

        if expanded {
            topContainterToBottomConstraint.isActive = false
            topContainerToViewConstraint.isActive = true
            bottomContainer.isHidden = false
        } else {
            topContainterToBottomConstraint.isActive = true
            topContainerToViewConstraint.isActive = false
            bottomContainer.isHidden = true
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        configure(grayedOut: false, expanded: false)
    }
}
