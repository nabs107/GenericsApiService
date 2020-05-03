//
//  ActivityIndicator.swift
//  GenericsApiService
//
//  Created by Nabin Shrestha on 5/3/20.
//  Copyright © 2020 Nabin Shrestha. All rights reserved.
//

import UIKit

public class ActivityIndicator {
    static let shared = ActivityIndicator()
    private final let indicator = UIActivityIndicatorView(style: .medium)
    
    private lazy var overlayView: UIView = UIView()
    private weak var view: UIView?
    
    init() {
        self.overlayView.translatesAutoresizingMaskIntoConstraints = false
        self.indicator.translatesAutoresizingMaskIntoConstraints = false
        self.indicator.hidesWhenStopped = true
    }
    
    func show(in view: UIView) {
        self.view = view
        view.addSubview(self.overlayView)
        
        NSLayoutConstraint.activate([
            self.overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            self.overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        self.overlayView.addSubview(self.indicator)
        NSLayoutConstraint.activate([
            self.indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.indicator.startAnimating()
    }
    
    func hide() {
        self.indicator.stopAnimating()
        self.indicator.removeFromSuperview()
        self.overlayView.removeFromSuperview()
    }
}
