//
//  ViewController.swift
//  Demo03
//
//  Created by 張哲禎 on 2019/11/19.
//  Copyright © 2019 張哲禎. All rights reserved.
//

import UIKit
import FacebookLogin
import Kingfisher


class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        let urlStr = URL(string: "https://www.viki.com/celebrities/14365pr-iu")
        
        self.imageView.kf.setImage(with: urlStr)
        //      如果能取得accessToken的話,就去做取得內容與資料,但其實accessToken沒有被用到,所以會有黃色的提示,顯示accessToken沒有被使用
        //        建立在viewDidLoad內，意義是打開這畫面就先檢查有沒有登入
        //        有登入記錄的話,就直接使用資料
//        
        if let accessToken = AccessToken.current {
            Profile.loadCurrentProfile { (profile, error) in
                if let profile = profile {
                    self.label.text = profile.name
                    let url = profile.imageURL(forMode: .normal, size: CGSize(width: 200, height: 200))
                    self.imageView.kf.setImage(with: url)
//                    self.fetchImage(url: url) { (image) in
//                        DispatchQueue.main.async {
//                            self.imageView.image = image
//                        }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btLogOut(_ sender: Any) {
        let manager = LoginManager()
        manager.logOut()
        imageView.image = nil
        label.text = ""
    }
    //    func fetchImage(url: URL?, completionHandler: @escaping (UIImage?)
    //        -> ()) {
    //        if let url = url {
    //            let task = URLSession.shared.dataTask(with: url) { (data,
    //                response, error) in
    //                if let data = data, let image = UIImage(data: data) {
    //                    completionHandler(image)
    //                } else {
    //                    completionHandler(nil)
    //                }
    //            }
    //            task.resume()
    //        }
    //    }
    
}

