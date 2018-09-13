//
//  ViewController.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 11..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class ViewController: UIViewController {

    var ref: DatabaseReference!
    var history: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var searchArr:[String] = []
    var searchCountry = [String]()
    var searching = false
    var searchFieldText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ref = Database.database().reference() //데이터베이스에 최상위 노드를 가리키는 작업
        
        ref.observe(.childAdded) { (DataSnapshot) in
            guard let value = DataSnapshot.value as? String else {return}
            print("item added")
            print("\(value)값이 등록되었습니다.")
            self.history.append(value)
            print(self.history)
        }
        
        
    }
    
    func makePostCall() {
        let todosEndpoint = "https://en.wikipedia.org/w/api.php?action=opensearch&search=\(searchFieldText)&limit=10&namespace=0&format=json"
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
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if searching{
            return searchCountry.count
        }else{
            return searchArr.count
        }
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
   
        let cell = UITableViewCell()
//        switch searching {
//        case false:
//            let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reusableIdentifier)
//            return cell!
//        case true:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//            if searching{
//                cell?.textLabel?.text = searchCountry[indexPath.row]
//            }else{
//                cell?.textLabel?.text = searchArr[indexPath.row]
//            }
//            return cell!
//        default:
//            return cell
//        }
        
        return cell
       
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchFieldText = searchText
        makePostCall()
        searchCountry = searchArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    @available(iOS 2.0, *)
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
    print("searchBarSearchButtonClicked")
    let itemsRef = ref.child((searchBar.text?.lowercased())!) //부모의 아들을 만들어서 선언하고
    itemsRef.setValue(searchBar.text) //셋 하면 값을 넣어주는 작업
    searchBar.text = ""
    tableView.reloadData()
}

}
