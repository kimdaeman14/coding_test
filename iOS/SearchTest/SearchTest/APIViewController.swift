//
//  APIViewController.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 11..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit
import Alamofire


class APIViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        takeData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func takeData(){
        
        let url = URL(string: "https://en.wikipedia.org/w/api.php")
        
        Alamofire.request(url!, method: HTTPMethod.get, parameters:["action":"opensearch","search":"purple","limit": 20,"namespace":0,"format":"json"])
            .validate(statusCode: 200..<400)
            .responseData { [weak self](response) in
                guard let strongSelf = self else { return }
                switch response.result{
                case .success(let value):
                    print(value, "일단 성공")
                    do{
                        print("1")
//                        let apiData = try JSONDecoder().decode(Cart.self, from: value)
//                        print(apiData)
                        print("2")
                    }catch{
                        print(error.localizedDescription, "success")
                    }
                case .failure(let error):
                    print(error, "failure")
                }
        }
    }

   

}
