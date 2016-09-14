//
//  ProductsTableViewCell.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/8/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit
import HCSStarRatingView

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var outOfStockLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var starRatingView: HCSStarRatingView!
    @IBOutlet weak var productReviewCountLabel: UILabel!
}