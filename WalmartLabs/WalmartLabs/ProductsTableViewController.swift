//
//  ProductsTableViewController.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/7/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit
import SDWebImage

class ProductsTableViewController: UITableViewController {

    let activityIndicator = UIActivityIndicatorView()
    let reuseIdentifier = "productCellIdentifier"
    var allProducts = [Product]()
    let dataRequest = DataRequest()
    let constants = Constants()
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Products"
        self.navigationController?.navigationBar.barTintColor = UIColor(netHex: 0x007dc6)
        self.fetchProducts()
    }

    func fetchProducts() {
        dataRequest.fetchProducts(currentPage) { result in
            switch result {
            case.onSuccess(let objects):
                self.allProducts += objects
                if self.allProducts.count > 0 {
                main {
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    }
                }
            case.onFailure(let error):
                print(error)
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ProductsTableViewCell
        let object = allProducts[indexPath.row]
        cell.productNameLabel.text = object.productName
        cell.productPriceLabel.text = String(object.productPrice)
        let placeholder = UIImage(named: "placeholder")
        cell.notInStockLabel.hidden = true

        if !object.inStock {
            cell.notInStockLabel.hidden = false
        }

        let productImageURL: NSURL? = NSURL(string: object.productImage)

        if let image = productImageURL {
            cell.productImage.sd_setImageWithURL(image, placeholderImage: placeholder)
        }
        return cell
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {

        if indexPath.row == allProducts.count - 1 {
            self.currentPage += 1
            self.fetchProducts()
        }
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(ProductDetailViewController) {
            let detailVC = segue.destinationViewController as! ProductDetailViewController
            detailVC.allProducts = NSArray(array: self.allProducts) as! [Product]
            let indexPath: NSIndexPath = tableView.indexPathForSelectedRow!
            detailVC.selectedIndex = indexPath.row
        }
    }
}

// http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}