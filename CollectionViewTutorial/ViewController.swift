//
//  ViewController.swift
//  CollectionViewTutorial
//
//  Created by Lazar Vlaovic on 10/3/17.
//  Copyright © 2017 Lazar Vlaovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Proporties
    let pages = ["yellow", "blue", "red"]
    let tutDescription = ["This is first page.", "This is second page.", "This is third page."]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.bounces = false
        
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
    }
    
    //MARK: - Collection Delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            cell.tutImage.image = UIImage(named: pages[indexPath.row])
            cell.tutDescription.text = tutDescription[indexPath.row]
            return cell
        }
        
        // If unable to dequeue cell, return cell with red background color
        return {
            let wrongCell = UICollectionViewCell()
            wrongCell.contentView.backgroundColor = .red
            return wrongCell
            }()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return .leastNonzeroMagnitude
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

