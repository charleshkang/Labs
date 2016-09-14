//
//  ProductDetailViewController.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/7/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit
import HCSStarRatingView

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productReviewCountLabel: UILabel!
    @IBOutlet weak var productDescTextView: UITextView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var outOfStockLabel: UILabel!
    @IBOutlet weak var starRatingView: HCSStarRatingView!

    var allProducts = [Product]()
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.tintColor = UIColor.whiteColor();
        updateUIWithProduct()

        let rightSwipe = UISwipeGestureRecognizer(target: self,
                                                  action: #selector(ProductDetailViewController.handleSwipeGestures(_:)))
        let leftSwipe = UISwipeGestureRecognizer(target: self,
                                                 action: #selector(ProductDetailViewController.handleSwipeGestures(_:)))
        rightSwipe.direction = .Right
        leftSwipe.direction = .Left
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productDescTextView.setContentOffset(CGPointZero, animated: false)
    }

    func updateUIWithProduct() {
        let product = allProducts[selectedIndex]
        productNameLabel.text = product.productName
        productPriceLabel.text = product.productPrice
        productReviewCountLabel.text = String("(\(product.reviewCount))")
        productDescTextView.text = product.longDesc
        starRatingView.value = CGFloat(product.reviewRating)
        outOfStockLabel.hidden = true

        if product.inStock?.boolValue == false {
            outOfStockLabel.hidden = false
            outOfStockLabel.textColor = UIColor.redColor()
        }

        let productImageURL: NSURL? = NSURL(string: product.productImage)
        let placeholderImg = UIImage(named: "placeholder_img")

        if let imageURL = productImageURL {
            productImageView.sd_setImageWithURL(imageURL, placeholderImage: placeholderImg)
        }
    }

    // MARK: - Swipe Animations
    func handleSwipeGestures(sender: UISwipeGestureRecognizer) {
        if sender.direction == .Right {
            if selectedIndex > 0 {
                selectedIndex -= 1
                updateUIWithProduct()
                animateRightViews()
            }
        } else if sender.direction == .Left {
            if selectedIndex + 1 < allProducts.count {
                selectedIndex += 1
                updateUIWithProduct()
                animateLeftViews()
            }
        }
    }
}