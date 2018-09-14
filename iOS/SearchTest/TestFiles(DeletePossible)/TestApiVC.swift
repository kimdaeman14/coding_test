//
//  APIViewController.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 11..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit

class TestApiVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!

    var searchArr:[String] = []
    
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
                let receiveData = receivedTodo as! NSArray
                self.searchArr = receiveData[1] as! [String]
                print(self.searchArr)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch  {
                print("parsing response가 잘못되었습니다.")
                return
            }
        }
        task.resume()
    }


}

extension TestApiVC : UITableViewDataSource {
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return searchArr.count
    }
    
   
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchArr[indexPath.row]
        return cell
    }
    
    
}
