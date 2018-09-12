//
//  APIViewController.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 11..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit

class TestApiVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        makePostCall()
    }

    func makePostCall() {
        let todosEndpoint = "https://en.wikipedia.org/w/api.php?action=opensearch&search=purple"
        guard let todosURL = URL(string: todosEndpoint) else {
            return print("검색값이 잘못되었습니다.")
        }
        let todosUrlRequest = URLRequest(url: todosURL)
        let task = URLSession.shared.dataTask(with: todosUrlRequest) { (data, response, error) in
            guard error == nil else { return print(error!) }
            guard let data = data else { return print("data가 없습니다.") }
            do {
                let receivedTodo = try JSONSerialization.jsonObject(with: data, options: [])
                let first = receivedTodo as! NSArray
                print(first[0])
                print(first[1])
                print(first[2])
            } catch  {
                print("parsing response가 잘못되었습니다.")
                return
            }
        }
        task.resume()
    }


}
