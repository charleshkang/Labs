//
//  ProductsDetailViewController.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/12/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit
import HCSStarRatingView

class ProductsDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    enum PresentationStatus {
        case HasNotScrolled
        case HasScrolled
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "productCellIdentifier"
    private let productRequester = ProductRequester()
    private(set) var presentationStatus = PresentationStatus.HasNotScrolled
    
    var allProducts = [Product]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if presentationStatus == .HasNotScrolled {
            
            collectionView.setContentOffset(CGPoint(x:(view.frame.width * CGFloat(selectedIndex)), y: 0), animated: false)
            presentationStatus = .HasScrolled
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allProducts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ProductsCollectionViewCell
        let product = allProducts[indexPath.row]
        
        cell.productNameLabel.text = String(htmlEncodedString: product.productName)
        cell.productPriceLabel.text = String(product.productPrice)
        cell.outOfStockLabel.hidden = true
        cell.starRatingView.value = CGFloat(product.reviewRating)
        cell.productReviewCountLabel.text = String("(\(product.reviewCount))")
        cell.productDescTextView.text = String(htmlEncodedString: product.longDesc)
        cell.productDescTextView.font = UIFont(name: "Helvetica Neue", size: 14.0)
        cell.productDescTextView.setContentOffset(CGPointZero, animated: false)
        cell.productDescTextView.textContainerInset = UIEdgeInsetsZero
        
        if !product.inStock! {
            cell.outOfStockLabel.hidden = false
            cell.outOfStockLabel.textColor = UIColor.redColor()
        }
        
        let productImageURL: NSURL? = NSURL(string: product.productImage)
        let placeholder = UIImage(named: "placeholder_img")
        if let image = productImageURL {
            cell.productImage.sd_setImageWithURL(image, placeholderImage: placeholder)
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let viewSize = view.frame.size
        return CGSize(width: viewSize.width, height: viewSize.height - 64)
    }
}