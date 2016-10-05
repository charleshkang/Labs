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
    
    func configure(with product: Product) {
        
        let encodedProductName = String(htmlEncodedString: product.productName)
        
        self.productNameLabel.text = NSLocalizedString(encodedProductName, comment: "")
        self.productPriceLabel.text = String(product.productPrice)
        self.outOfStockLabel.hidden = true
        self.starRatingView.value = CGFloat(product.reviewRating)
        self.productReviewCountLabel.text = String("(\(product.reviewCount))")
        
        if !product.inStock {
            self.outOfStockLabel.hidden = false
            self.outOfStockLabel.textColor = .redColor()
        }
        
        let productImageURL: NSURL? = NSURL(string: product.productImage)
        let placeholder = UIImage(named: "placeholder_img")
        if let image = productImageURL {
            self.productImage.sd_setImageWithURL(image, placeholderImage: placeholder)
        }
    }
}