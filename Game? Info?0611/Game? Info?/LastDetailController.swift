//
//  LastDetailController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 6. 11..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit

class LastDetailController: UITableViewController, XMLParserDelegate {
    @IBOutlet var DtData: UITableView!
    @IBOutlet weak var GameImage: UIImageView!
    
    
    var url : String?
    var parser = XMLParser()
    var postname : [String] = ["등급분류기관" ,"게임타이틀", "회사", "신청등급", "결정등급", "등급분류번호", "등급분류일자"]
    var posts : [String] = ["", "", "", "", "", ""]
    var element = NSString()
    
    var orgname = NSMutableString()
    var gametitle = NSMutableString()
    var entname = NSMutableString()
    var hoperate = NSMutableString()
    var givenrate = NSMutableString()
    var rateno = NSMutableString()
    var rateddate = NSMutableString()
    
    var gametitles : String?
    var gametitles_utf8 : String?
    
    //var url2 : String = "https://openapi.naver.com/v1/search/image.xml?query=" + gametitles_utf8! + "&display=10&start=1&sort=sim"
    var id = "Dskw0fscEI5FWdv3UgOe"
    var password = "ERlx5Z5snY"
    var image = UIImage()
    
//    func head(){
//        let request = NSMutableURLRequest(url : URL(string: "https://openapi.naver.com/v1/search/image.xml?query=" + gametitles_utf8! + "&display=10&start=1&sort=sim")! as URL)
//        let session = URLSession.shared
//        request.httpMethod = "GET"
//        request.addValue("X-Naver-Client-Id", forHTTPHeaderField: "Dskw0fscEI5FWdv3UgOe")
//        request.addValue("X-Naver-Client-Secret", forHTTPHeaderField: "ERlx5Z5snY")
//
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
//            if error != nil{
//                print("Error: \(String(describing: error))")
//            }
//            else{
//                print("Response: \(String(describing: response))")
//            }
//        })
//        task.resume()
//    }
    
    func beginParsing(){
        //GameImage.image = image
        print(url)
        posts = []
        parser = XMLParser(contentsOf: (URL(string: url!))!)!
        parser.delegate = self
        parser.parse()
        
        DtData!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName : String?, attributes attributeDict: [String : String]){
        element = elementName as NSString
       
        if (elementName as NSString).isEqual(to: "item"){
            posts = ["", "", "", "", "", "", ""]
            orgname = NSMutableString()
            orgname = ""
            gametitle = NSMutableString()
            gametitle = ""
            entname = NSMutableString()
            entname = ""
            hoperate = NSMutableString()
            hoperate = ""
            givenrate = NSMutableString()
            givenrate = ""
            rateno = NSMutableString()
            rateno = ""
            rateddate = NSMutableString()
            rateddate = ""
        }
      
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "orgname"){
            orgname.append(string)
        }
        else if element.isEqual(to: "gametitle"){
            gametitle.append(string)
        }
        else if element.isEqual(to: "entname"){
            entname.append(string)
        }
        else if element.isEqual(to: "hoperate"){
            hoperate.append(string)
        }
        else if element.isEqual(to: "givenrate"){
            givenrate.append(string)
        }
        else if element.isEqual(to: "rateno"){
            rateno.append(string)
        }
        else if element.isEqual(to: "rateddate"){
            rateddate.append(string)
        }
       
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if (elementName as NSString).isEqual(to: "item"){
            if !orgname.isEqual(nil){
                posts[0] = orgname as String
            }
            if !gametitle.isEqual(nil){
                posts[1] = gametitle as String
            }
            if !entname.isEqual(nil){
                posts[2] = entname as String
            }
            if !hoperate.isEqual(nil){
                posts[3] = hoperate as String
            }
            if !givenrate.isEqual(nil){
                posts[4] = givenrate as String
            }
            if !rateno.isEqual(nil){
                posts[5] = rateno as String
            }
            if !rateddate.isEqual(nil){
                posts[6] = rateddate as String
            }
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //head()
        beginParsing()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.textLabel?.text = postname[indexPath.row]
        cell.detailTextLabel?.text = posts[indexPath.row]
        // Configure the cell...
        return cell
    }

}
