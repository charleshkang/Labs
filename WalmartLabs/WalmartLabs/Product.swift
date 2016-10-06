//
//  Product.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/7/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation

struct Product {

    let productName: String
    let longDescription: String
    let productPrice: String
    let productImage: String
    let reviewRating: Int
    let reviewCount: Int
    let inStock: Bool
    var totalProducts: Int?
    
    //MARK: - Lifecycle
    init(productName: String,
         longDescription: String,
         productPrice: String,
         productImage: String,
         reviewRating: Int,
         reviewCount: Int,
         inStock: Bool) {

            self.productName = productName
            self.longDescription = longDescription
            self.productPrice = productPrice
            self.productImage = productImage
            self.reviewRating = reviewRating
            self.reviewCount = reviewCount
            self.inStock = inStock
    }
}