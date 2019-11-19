//
//  facebookLogin.swift
//  Demo03
//
//  Created by 張哲禎 on 2019/11/19.
//  Copyright © 2019 張哲禎. All rights reserved.
//

import UIKit
import FacebookLogin

class facebookLogin: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func login(_ sender: Any) {
        let manager = LoginManager()
        
        return 
        
//        permission為登入時需要什麼權限,例如要po文章要發動態,要先跟使用者要權限
//        publicprofile為不需要特別跟fb要求就可以拿到的東西
        manager.logIn(permissions: [.publicProfile], viewController: self) { (result) in
//            LoginResult為系統內建的enum,其中case 不只可寫變數,也可以寫關聯式（帶有參數）
//            若要比較或對enum case內的關聯式參數作限制,需要使用 if case
            if case LoginResult.success(granted: _, declined: _, token: _) = result {
                print("login ok")
                 self.dismiss(animated: true)
            } else {
                print("login fail")
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
