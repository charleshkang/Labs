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
    
    // MARK: - IBOutlets
    @IBOutlet private weak var outOfStockLabel: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productPriceLabel: UILabel!
    @IBOutlet private weak var starRatingView: HCSStarRatingView!
    @IBOutlet private weak var productReviewCountLabel: UILabel!
    @IBOutlet private weak var productDescTextView: UITextView!
    
    //MARK: - Public
    func configure(with product: Product) {
        
        let decodedProductName = String(htmlEncodedString: product.productName)
        let decodedProductDescription = String(htmlEncodedString: product.longDescription)
        
        productNameLabel.text = NSLocalizedString(decodedProductName, comment: "")
        productPriceLabel.text = NSLocalizedString(String(product.productPrice), comment: "")
        productPriceLabel.text = String(product.productPrice)
        outOfStockLabel.hidden = true
        starRatingView.value = CGFloat(product.reviewRating)
        productReviewCountLabel.text = String("(\(product.reviewCount))")
        productDescTextView.text = NSLocalizedString(decodedProductDescription, comment: "")
        productDescTextView.font = UIFont(name: "Helvetica Neue", size: 14.0)
        productDescTextView.setContentOffset(CGPointZero, animated: false)
        productDescTextView.textContainerInset = UIEdgeInsetsZero
        
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