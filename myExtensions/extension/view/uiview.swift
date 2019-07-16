//
//  uiview.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/17.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

extension UIView {
    ///引数のviewを常に自分のサイズと中心に合わせる(addSubviewしてから使う)
    public func addFitConstraints(to: UIView) {
        to.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: to,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: 0))
        self.addConstraint(NSLayoutConstraint(item: to,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .leading,
                                              multiplier: 1.0,
                                              constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: to,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: to,
                                              attribute: .trailing,
                                              multiplier: 1.0,
                                              constant: 0))
    }
}
