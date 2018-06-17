//
//  GotyResultController.swift
//  Game? Info?
//
//  Created by 윤진우 on 2018. 6. 17..
//  Copyright © 2018년 JINWOO YOON. All rights reserved.
//

import UIKit

class GotyResultController: UITableViewController {
    
    var Gotygame : String?
    var Gotygames : [String?] = []
    var GameMax = 2
    var GameNumber = 0
    var test : String?
    
    func beginSet(){
        if Gotygame == "하프라이프2"{
            Gotygames = ["하프라이프2", "헤일로2", "GTA-산 안드레스"]
            test = "2004년도 Goty"
        }
        else if Gotygame == "바이오하자드4"{
            Gotygames = ["바이오하자드 4", "완다와 거상", "갓 오브 워"]
            test = "2005년도 Goty"
        }
        else if Gotygame == "엘더스크롤4"{
            Gotygames = ["엘더스크롤4 : 오블리비언", "기어스 오브 워", "젤다의 전설 황혼의 공주"]
            test = "2006년도 Goty"
        }
        else if Gotygame == "바이오쇼크"{
            Gotygames = ["바이오쇼크", "슈퍼마리오 Wii 갤럭시 어드벤처", "콜 오브 듀티4: 모던 워페어"]
            test = "2007년도 Goty"
        }
        else if Gotygame == "폴아웃3"{
            Gotygames = ["폴아웃3", "GTA4", "메탈기어 솔리드 4"]
            test = "2008년도 Goty"
        }
        else if Gotygame == "언차티드2"{
            Gotygames = ["언차티드2 : 황금도와 사라진 함대", "배트맨 : 아캄 어사이럼", "콜 오브 듀티-모던 워페어2"]
            test = "2009년도 Goty"
        }
        else if Gotygame == "레드데드리뎀션"{
            Gotygames = ["레드 데드 리뎀션", "매스 이펙트 2", "슈퍼마리오 Wii2 : 갤럭시 어드벤처 투게더"]
            test = "2010년도 Goty"
        }
        else if Gotygame == "엘더스크롤5"{
            Gotygames = ["엘더스크롤5 스카이림", "포탈 2", "배트맨 : 아캄시티"]
            test = "2011년도 Goty"
        }
        else if Gotygame == "워킹데드시즌1"{
            Gotygames = ["워킹 데드", "저니", "파 크라이 3"]
            test = "2012년도 Goty"
        }
        else if Gotygame == "더라스트오브어스"{
            Gotygames = ["더 라스트 오브 어스", "GTA5", "바이오쇼크 인피니트"]
            test = "2013년도 Goty"
        }
        else if Gotygame == "드래곤에이지:인퀴지션"{
            Gotygames = ["드래곤에이지 : 인퀴지션", "미들 어스 : 새도우 오브 모르도르", "마리오 카트8"]
            test = "2014년도 Goty"
        }else if Gotygame == "더위쳐3"{
            Gotygames = ["더 위쳐3: 와일드 헌트", "폴아웃 4", "블러드본"]
            test = "2015년도 Goty"
        }else if Gotygame == "언차티드4"{
            Gotygames = ["언챠티드4: 해적왕과 최후의 보물", "오버워치", "둠"]
            test = "2016년도 Goty"
        }else if Gotygame == "젤다의전설:브레스오브더와일드"{
            Gotygames = ["젤다의 전설 브레스 오브 더 와일드", "호라이즌 제로 던", "슈퍼 마리오 오디세이"]
            test = "2017년도 Goty"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        beginSet()

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
        return Gotygames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = Gotygames[indexPath.row]
        cell.detailTextLabel?.text = test

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
