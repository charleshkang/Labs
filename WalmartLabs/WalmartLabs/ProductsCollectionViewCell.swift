//
//  ProductsCollectionViewCell.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/12/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit
import HCSStarRatingView

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outOfStockLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var starRatingView: HCSStarRatingView!
    @IBOutlet weak var productReviewCountLabel: UILabel!
    @IBOutlet weak var productDescTextView: UITextView!
}