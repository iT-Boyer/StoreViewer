//
//  ViewController.swift
//  StoreViewer
//
//  Created by boyer on 2021/9/16.
//

import UIKit

class ViewController: UIViewController {

    //https://www.hackingwithswift.com/quick-start/understanding-swift/when-should-you-use-property-observers
    var pictures = [String]()
    let tableView = {
        //使用getter方法
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .gray
        loadData()
    }
    
    //读取document目录中的文件名
    func loadData(){
        let path = Bundle.main.resourcePath!
        let files = try! FileManager.default.contentsOfDirectory(atPath: path)
        for item in files {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    func createView() {
        self.view.addSubview(tableView)
    }
}




extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
//        cell.imageView = UIImageView(image: UIImage(named: pictures[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
}
