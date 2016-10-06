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
    
    // MARK: - IBOutlets
    @IBOutlet private weak var outOfStockLabel: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    @IBOutlet private weak var starRatingView: HCSStarRatingView!
    @IBOutlet private weak var productReviewCountLabel: UILabel!
    
    //MARK: - Public
    func configure(with product: Product) {
        
        let encodedProductName = String(htmlEncodedString: product.productName)
        
        productNameLabel.text = NSLocalizedString(encodedProductName, comment: "")
        productPriceLabel.text = String(product.productPrice)
        outOfStockLabel.hidden = true
        starRatingView.value = CGFloat(product.reviewRating)
        productReviewCountLabel.text = String("(\(product.reviewCount))")
        
        if !product.inStock {
            outOfStockLabel.hidden = false
            outOfStockLabel.textColor = .redColor()
        }
        let productImageURL: NSURL? = NSURL(string: product.productImage)
        let placeholder = UIImage(named: "placeholder_img")
        if let image = productImageURL {
            productImage.sd_setImageWithURL(image, placeholderImage: placeholder)
        }
    }
}