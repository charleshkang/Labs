//
//  ProductsViewController.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/10/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit
import SDWebImage
import HCSStarRatingView

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private let reuseIdentifier = "productCellIdentifier"
    private let productRequester = ProductRequester()
    private var startIndex = 0
    private var allProducts = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Products"
        navigationController?.navigationBar.barTintColor = UIColor(hexValue: 0x007dc6)
        tableView.delegate = self
        tableView.dataSource = self
        fetchProducts()
    }
    
    func fetchProducts() {
        activityIndicator.startAnimating()
        productRequester.fetchProducts(startIndex) { result in
            switch result {
            case.Success(let products):
                self.allProducts += products
                if self.allProducts.count > 0 {
                    main {
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.hidden = true
                        self.tableView.reloadData()
                    }
                }
            case.Failure(let error):
                self.activityIndicator.stopAnimating()
                
                let errorAlert = UIAlertController(title: "Error",
                                                   message: "\(error)",
                                                   preferredStyle: UIAlertControllerStyle.Alert)
                errorAlert.addAction(UIAlertAction(title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: nil))
                self.presentViewController(errorAlert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ProductsTableViewCell
        let product = allProducts[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    // MARK: - Table view delegate
    // Fetches and displays more products if index is less than maxProducts
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let maximum = productRequester.maxProducts
            where startIndex + Constants.pageSize < maximum
            else {
                activityIndicator.stopAnimating()
                activityIndicator.hidden = true
                return
        }
        
        if indexPath.row == allProducts.count - 1 {
            activityIndicator.hidden = false
            self.startIndex += Constants.pageSize
            fetchProducts()
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isKindOfClass(ProductsDetailViewController) {
            let detailVC = segue.destinationViewController as! ProductsDetailViewController
            detailVC.allProducts = allProducts
            let indexPath: NSIndexPath = tableView.indexPathForSelectedRow!
            detailVC.selectedIndex = indexPath.row
        }
    }
}