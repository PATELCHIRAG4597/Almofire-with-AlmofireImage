//
//  ViewController.swift
//  Almofire with AlmofireImage
//
//  Created by CodeInfoWay CodeInfoWay on 3/7/23.
//
import UIKit
import Alamofire
import AlamofireImage
import AlamofireSwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var MyTable: UITableView!
    var SuperHiro = [[String:Any]]()
    let progressView = UIProgressView(progressViewStyle: .default)
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 2)
        view.addSubview(progressView)
        getJSONData()
    }
    
    func getJSONData()
    {
        let urlFile = "https://simplifiedcoding.net/demos/marvel/"
        let request = Alamofire.request(urlFile)
        request.downloadProgress { progress in
            self.progressView.progress = Float(progress.fractionCompleted)
        }
        request.responseJSON {(response) in
            switch response.result
            {
            case.success(_):
                let jsondata = response.result.value as! [[String:Any]]?
                self.SuperHiro = jsondata!
                self.MyTable.reloadData()
                
            case.failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                
            }
            self.progressView.isHidden = true
        }
        self.progressView.isHidden = false
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SuperHiro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MYTableViewCell
        cell.MyLable.text = SuperHiro[indexPath.row]["name"] as? String
        
        let urlImage = SuperHiro[indexPath.row]["imageurl"] as? String
        Alamofire.request(urlImage!).responseImage{(response) in
            if let image = response.result.value
            {
                DispatchQueue.main.async{
                    cell.MyImage.image = image
                }
            }
        }
        return cell
    }
}






























//import UIKit
//import Alamofire
//import AlamofireImage
//import AlamofireSwiftyJSON
//
//class ViewController: UIViewController {
//    @IBOutlet weak var MyTable: UITableView!
//
//    var SuperHiro = [[String:Any]]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        getJSONData()
//    }
//    func getJSONData()
//    {
//      let urlFile = "https://simplifiedcoding.net/demos/marvel/"
//        Alamofire.request(urlFile).responseJSON {(response) in
//            switch response.result
//            {
//            case.success(_):
//                let jsondata = response.result.value as! [[String:Any]]?
//                self.SuperHiro = jsondata!
//                self.MyTable.reloadData()
//
//            case.failure(let error):
//                print("Error occured\(error.localizedDescription)")
//
//            }
//
//        }
//
//    }
//
//}
//extension ViewController:UITableViewDelegate,UITableViewDataSource
//{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return SuperHiro.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = MyTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MYTableViewCell
//        cell.MyLable.text = SuperHiro[indexPath.row]["name"] as? String
//        //cell.MyLable.text = SuperHiro[indexPath.row]["realname"] as? String
//        let urlImage = SuperHiro[indexPath.row]["imageurl"] as? String
//        Alamofire.request(urlImage!).responseImage{(responce) in
//            if let image = responce.result.value
//            {
//                DispatchQueue.main.async{
//                    cell.MyImage.image = image
//                }
//            }
//
//         }
//        return cell
//
//    }
//}
