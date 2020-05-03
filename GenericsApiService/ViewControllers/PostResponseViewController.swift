//
//  PostResponseViewController.swift
//  GenericsApiService
//
//  Created by Nabin Shrestha on 5/3/20.
//  Copyright © 2020 Nabin Shrestha. All rights reserved.
//

import UIKit

final class PostResponseViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.idLabel.text = id?.description
    }

}
