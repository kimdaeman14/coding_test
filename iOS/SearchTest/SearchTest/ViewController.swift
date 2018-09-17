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
        tableView.register(UINib(nibName: "DatabaseCustomCell", bundle: nil), forCellReuseIdentifier: DatabaseCustomCell.reusableIdentifier)
        tableView.register(UINib(nibName: "APICustomCell", bundle: nil), forCellReuseIdentifier: APICustomCell.reusableIdentifier)

        ref = Database.database().reference()
        
        ref.observe(.childAdded) { (DataSnapshot) in
            guard let value = DataSnapshot.value as? String else {return}
            print("\(value)값이 등록되었습니다.")
            self.history.insert(value, at: 0)
            self.tableView.reloadData()
        }
        
        ref.observe(.childRemoved) { (DataSnapshot) in
            guard let value = DataSnapshot.value as? String else {return}
            print("item deleteed")
            print("\(value)값이 삭제되었습니다.")
            self.tableView.reloadData()
        }
    }
   
    
    func makePostCall() {
        let todosEndpoint = "https://en.wikipedia.org/w/api.php?action=opensearch&search=\(searchFieldText)&limit=20&namespace=0&format=json"
        guard let todosURL = URL(string: todosEndpoint) else {
            return print("검색값이 존재하지 않습니다.")
        }
        let todosUrlRequest = URLRequest(url: todosURL)
        let task = URLSession.shared.dataTask(with: todosUrlRequest) { (data, response, error) in
            guard error == nil else { return print(error!) }
            guard let data = data else { return print("data가 없습니다.") }
            do {
                let receivedTodo = try JSONSerialization.jsonObject(with: data, options: [])
                let receiveData = receivedTodo as! NSArray
                self.searchArr = receiveData[1] as! [String]
                
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

//MARK: - HistoryDBdeleteDelegate

extension ViewController: HistoryDBdeleteDelegate {
    func historyDBDelete(string: String, index:Int){
        ref.child(string).removeValue { (error, ref) in
            if error != nil{
                print("error \(String(describing: error))")
            }
        }
        
        history.remove(at: index)
        self.tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if searching{
            return searchCountry.count
        }else{
            if history.count > 20{
                return 20
            }else{
                return history.count
            }
        }
        

    }
    
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        switch searching {
        case true:
            let cell = tableView.dequeueReusableCell(withIdentifier: APICustomCell.reusableIdentifier, for: indexPath) as! APICustomCell
            if searching{
                cell.ApiLabel.text = searchCountry[indexPath.row]
            }else{
                cell.ApiLabel.text = searchArr[indexPath.row]
            }
            return cell
        case false:
            let cell = tableView.dequeueReusableCell(withIdentifier: DatabaseCustomCell.reusableIdentifier, for: indexPath) as! DatabaseCustomCell
            cell.delegate = self
            cell.historyLabel.text = history[indexPath.row]

            cell.indexPath = indexPath.row
            
            
            

            
            return cell
        }

    }
}

//MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchFieldText = searchText
        if searchFieldText == ""{
            searchBar.placeholder = "검색하실 단어를 입력해주세요."
            searching = false
        }else{
            makePostCall()
            searching = true
        }
        searchCountry = searchArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        tableView.reloadData()
    }
    
    @available(iOS 2.0, *)
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
    let itemsRef = ref.child((searchBar.text?.lowercased())!)
    itemsRef.setValue(searchBar.text)
    searchBar.text = ""
    searching = false
    tableView.reloadData()
}

}

