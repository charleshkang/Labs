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
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "productCellIdentifier"
    private let productRequester = ProductRequester()
    private(set) var presentationStatus = PresentationStatus.HasNotScrolled
    
    var allProducts = [Product]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .whiteColor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if presentationStatus == .HasNotScrolled {
            
            collectionView.setContentOffset(CGPoint(x:(view.frame.width * CGFloat(selectedIndex)), y: 0), animated: false)
            presentationStatus = .HasScrolled
        }
    }
    
    // MARK: - Collection view data source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allProducts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ProductsCollectionViewCell
        let product = allProducts[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    // MARK: - Collection view layout
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