//
//  ProductRequester
//  WalmartLabs
//
//  Created by Charles Kang on 9/10/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation
import SwiftyJSON

public func main(function: () -> Void) {
    dispatch_async(dispatch_get_main_queue(), function)
}

public func background(function: () -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), function)
}

enum Result<T> {
    case Success(T)
    case Failure(RequestError)
}

enum SuccessStatusCode: Int {
    case OK = 200
}

enum RequestError: ErrorType {
    case InvalidJSON
    case UnAuthorizedCall
    case UnexpectedError

    init(code: Int) {
        switch code {
        case 401: self = .UnAuthorizedCall
        default: self = .UnexpectedError
        }
    }
}

class ProductRequester {

    private let constants = Constants()
    private let dataParser = DataParser()
    private(set) var maxProducts: Int?

    func fetchProducts(startIndex: Int, completion: ((Result<[Product]>) -> Void)?) {
        let urlString = "\(Constants.baseURL)/\(Constants.apiKey)/\(startIndex)/\(Constants.pageSize)"

        background {

            guard let url = NSURL(string: urlString) else { return }
            guard let data = try? NSData(contentsOfURL: url, options: []) else {
                main { completion?(.Failure(.InvalidJSON)) }
                return
            }
            let json = JSON(data: data)

            guard let statusCode = self.dataParser.parseStatusCode(json) else {
                main { completion?(.Failure(.UnexpectedError)) }
                return
            }

            guard statusCode == SuccessStatusCode.OK.rawValue else {
                main { completion?(.Failure(RequestError.init(code: statusCode))) }
                return
            }

            guard let maxProducts = self.dataParser.parseMaxProducts(json) else {
                main { completion?(.Failure(.InvalidJSON)) }
                return
            }
            self.maxProducts = maxProducts
            let products = self.dataParser.parseProductJSON(json)
            main { completion?(.Success(products)) }
        }
    }
}