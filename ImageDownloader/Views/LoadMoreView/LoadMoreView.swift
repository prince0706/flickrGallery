//
//  LoadMoreView.swift
//  Geenie
//
//  Created by Sanjay Kumar Yadav on 20/12/17.
//  Copyright © 2017 Appster LLP. All rights reserved.
//

import UIKit

class LoadMoreView: UIView {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    class func loadMoreView() -> LoadMoreView {
        guard let instance = Bundle.main.loadNibNamed("LoadMoreView", owner: self)?.first as? LoadMoreView else {
            fatalError("Could not instantiate from nib: LoadMoreView")
        }
        return instance
    }

}
