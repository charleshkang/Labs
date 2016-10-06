//
//  ProductDataParser.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/10/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductDataParser {

    func parseProductJSON(json: JSON) -> [Product] {
        let allProducts = json["products"]
        return allProducts.flatMap { (_, result) in
            guard
                let productName = result["productName"].string,
                productPrice = result["price"].string,
                productImage = result["productImage"].string,
                reviewRating = result["reviewRating"].int,
                reviewCount = result["reviewCount"].int,
                inStock = result["inStock"].bool
                else { return nil }
            let longDescription = result["longDescription"].string ?? "No long description available"

            return Product(productName: productName,
                longDescription: longDescription,
                productPrice: productPrice,
                productImage: productImage,
                reviewRating: reviewRating,
                reviewCount: reviewCount,
                inStock: inStock)
        }
    }

    func parseMaxProducts(json: JSON) -> Int? {
        return json["totalProducts"].int
    }

    func parseStatusCode(json: JSON) -> Int? {
        return json["status"].int
    }
}