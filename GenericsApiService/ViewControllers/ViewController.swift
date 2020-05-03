//
//  ViewController.swift
//  GenericsApiService
//
//  Created by Nabin Shrestha on 5/3/20.
//  Copyright © 2020 Nabin Shrestha. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var getBtn: UIButton! {
        didSet {
            self.getBtn.layer.cornerRadius = 25
            self.getBtn.addTarget(self, action: #selector(self.getBtnTapped), for: .touchUpInside)
        }
    }
    @IBOutlet weak var postBtn: UIButton! {
        didSet {
            self.postBtn.layer.cornerRadius = 25
            self.postBtn.addTarget(self, action: #selector(self.postBtnTapped), for: .touchUpInside)
        }
    }
    
    private final let getURLString = "https://gist.githubusercontent.com/nabs107/c39c9206df72573d66576e5085398ed3/raw/03234081f0c9c846913b6d14a9eec26ad9d204ce/getrequestexample.json"
    
    private final let postURLString = "https://jsonplaceholder.typicode.com/posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc
    func getBtnTapped() {
        if let url = URL(string: self.getURLString) {
            ActivityIndicator.shared.show(in: self.view)
            APIService.shared.getRequest(url: url, type: Images.self, completionHandler: { (response) in
                if response.success ?? false, let imagesData = response.data, !imagesData.isEmpty {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        ActivityIndicator.shared.hide()
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GetResultViewController") as! GetResultViewController
                        vc.imageData = imagesData
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }) { (error) in
                print("Could not fetch images!")
            }
        }
    }
    
    @objc
    func postBtnTapped() {
        
        let params: [String: Any] = ["title": "foo", "body": "bar", "userId": 1, "id": 101]
        
        if let url = URL(string: self.postURLString) {
            ActivityIndicator.shared.show(in: self.view)
            APIService.shared.postRequest(url: url, params: params, type: User.self, completionHandler: { (response) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    ActivityIndicator.shared.hide()
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PostResponseViewController") as! PostResponseViewController
                    vc.id = response.id
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }) { (error) in
                print(error)
            }
        }
    }

}

