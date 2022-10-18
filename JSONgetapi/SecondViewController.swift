//
//  SecondViewController.swift
//  JSONgetapi
//
//  Created by Sadia on 17/10/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var arrData = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

        getAllProductsFromApi()
        tableview.delegate = self
        tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var apiManager = APIManager()
    func getAllProductsFromApi() {
            apiManager.getData { result in
                switch result {
                case .success(let productList):
                    self.allProducts(products: productList.products)
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    func allProducts(products: [Product])  {
        arrData = products
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
}

extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let product = arrData[indexPath.row]
        cell.firstLabel.text = product.title
        cell.secondLabel.text = "\(product.price)"
       return cell
    }
}

extension SecondViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = arrData[indexPath.row]
        print(product.title)
    }
}
