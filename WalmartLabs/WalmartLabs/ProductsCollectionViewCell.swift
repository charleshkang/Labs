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
    
    @IBOutlet private weak var outOfStockLabel: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    @IBOutlet private weak var starRatingView: HCSStarRatingView!
    @IBOutlet private weak var productReviewCountLabel: UILabel!
    @IBOutlet private weak var productDescTextView: UITextView!
    
    func configure(with product: Product) {
        
        let decodedProductName = String(htmlEncodedString: product.productName)
        let decodedProductDescription = String(htmlEncodedString: product.longDescription)
        
        self.productNameLabel.text = NSLocalizedString(decodedProductName, comment: "")
        self.productPriceLabel.text = NSLocalizedString(String(product.productPrice), comment: "")
        self.productPriceLabel.text = String(product.productPrice)
        self.outOfStockLabel.hidden = true
        self.starRatingView.value = CGFloat(product.reviewRating)
        self.productReviewCountLabel.text = String("(\(product.reviewCount))")
        self.productDescTextView.text = NSLocalizedString(decodedProductDescription, comment: "")
        self.productDescTextView.font = UIFont(name: "Helvetica Neue", size: 14.0)
        self.productDescTextView.setContentOffset(CGPointZero, animated: false)
        self.productDescTextView.textContainerInset = UIEdgeInsetsZero
        
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