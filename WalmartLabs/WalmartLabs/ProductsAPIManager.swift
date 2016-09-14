//
//  ProductsAPIManager.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/7/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductsAPIManager {

    let constants = Constants()

    func fetchProductsForPage(pageNumber: Int = 0, completion: ((Result<[Product]>) -> Void)? = nil) {
        let urlString = "https://walmartlabs-test.appspot.com/_ah/api/walmart/v1/walmartproducts/\(constants.apiKey)/\(pageNumber)/\(constants.pageSize)"
        print(urlString)

        background {
            guard let url = NSURL(string: urlString) else { return }
            guard let data = try? NSData(contentsOfURL: url, options: []) else {
                main { completion!(.failure(Error.InvalidJSON)) }
                return
            }
            let json = JSON(data: data)
            let products = self.parseProductJSON(json)
            main { completion!(.success(products)) }
        }
    }

    func parseProductJSON(json: JSON) -> [Product] {
        let allProducts = json["products"]
        return allProducts.flatMap { (_, result) in
            guard
                let productName = result["productName"].string,
                productId = result["productId"].string,
                longDesc = result["longDescription"].string,
                productPrice = result["price"].string,
                productImage = result["productImage"].string,
                reviewRating = result["reviewRating"].int,
                reviewCount = result["reviewCount"].int,
                var inStock = result["inStock"].bool
                else { return nil }

            if result["inStock"].intValue == 1 {
                inStock = true
            } else {
                inStock = false
            }
            return Product(productId: productId, productName: productName, longDesc: longDesc, productPrice: productPrice, productImage: productImage, reviewRating: reviewRating, reviewCount: reviewCount, inStock: inStock)
        }
    }
}