//
//  ImageSliderViewModel.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import UIKit
import Kingfisher
class ImageSliderView: UIView {

    @IBOutlet var pageControl : UIPageControl!
    @IBOutlet var scrView : UIScrollView!
    var viewModel : CarSpecificationViewModel!

    override func awakeFromNib() {

    }
    
    func setUpImageScroller() {
        var xAxis : CGFloat   = 0.0
        pageControl.numberOfPages =  viewModel.car.img!.count
        for (_, url) in viewModel.car.img!.enumerated() {
            let imageView         = UIImageView(frame: CGRect(x: xAxis , y: 0, width: self.frame.width,height:self.frame.height))
            imageView.contentMode = .scaleAspectFit
            imageView.kf.setImage(with: URL(string: url))
            scrView.addSubview(imageView)
            xAxis                 += self.frame.width
        }
         scrView.contentSize   = CGSize(width: xAxis, height: self.frame.size.height)
    }

}

// MARK:- UIScrollView Delagates
extension ImageSliderView : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       pageControl.currentPage = Int(self.scrView.contentOffset.x / self.frame.width)
    }
    
}
