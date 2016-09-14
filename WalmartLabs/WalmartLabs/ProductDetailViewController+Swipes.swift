//
//  ProductDetailViewController+Swipes.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/11/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit

extension ProductDetailViewController {

    func animateRightViews(){

        let transform = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        self.productNameLabel.layer.transform = transform
        self.productReviewCountLabel.layer.transform = transform
        self.productDescTextView.layer.transform = transform
        self.productPriceLabel.layer.transform = transform
        self.productImageView.layer.transform = transform
        self.outOfStockLabel.layer.transform = transform
        self.starRatingView.layer.transform = transform

        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.productNameLabel.layer.transform = CATransform3DIdentity
            self.productReviewCountLabel.layer.transform = CATransform3DIdentity
            self.productDescTextView.layer.transform = CATransform3DIdentity
            self.productPriceLabel.layer.transform = CATransform3DIdentity
            self.productImageView.layer.transform = CATransform3DIdentity
            self.outOfStockLabel.layer.transform = CATransform3DIdentity
            self.starRatingView.layer.transform = CATransform3DIdentity
        })
    }

    func animateLeftViews() {
        let transform = CATransform3DTranslate(CATransform3DIdentity, 500, 0, 0)
        self.productNameLabel.layer.transform = transform
        self.productReviewCountLabel.layer.transform = transform
        self.productDescTextView.layer.transform = transform
        self.productPriceLabel.layer.transform = transform
        self.productImageView.layer.transform = transform
        self.outOfStockLabel.layer.transform = transform
        self.starRatingView.layer.transform = transform

        UIView.animateWithDuration(0.5, animations: { () -> Void in

            self.productNameLabel.layer.transform = CATransform3DIdentity
            self.productReviewCountLabel.layer.transform = CATransform3DIdentity
            self.productDescTextView.layer.transform = CATransform3DIdentity
            self.productPriceLabel.layer.transform = CATransform3DIdentity
            self.productImageView.layer.transform = CATransform3DIdentity
            self.outOfStockLabel.layer.transform = CATransform3DIdentity
            self.starRatingView.layer.transform = CATransform3DIdentity
        })
    }
}