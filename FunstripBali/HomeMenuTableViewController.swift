//
//  HomeMenuTableViewController.swift
//  FunstripBali
//
//  Created by Becak Holic on 11/25/17.
//  Copyright © 2017 Sam Pramudana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeMenuTableViewController: UITableViewController {
    
    var judulSelected:String?
    var isiSelected:String?
    var katSelected:String?
    
    var arrRes = [[String : AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("http://localhost/WisataBali/index.php/api/getWisata").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
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
        return arrRes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHome", for: indexPath) as! HomeMenuTableViewCell

        // Configure the cell...
        var dict = arrRes[indexPath.row]
        cell.judulLabel.text = dict["judul"] as! String
        cell.kategoriLabel.text = dict["id_kategori"] as! String

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrRes[indexPath.row]
        judulSelected = task["judul"] as! String
        isiSelected = task["isi_wisatabali"] as! String
        katSelected = task["id_kategori"] as! String
        
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passData" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! IsiBeritaViewController
                let value = arrRes[indexPath.row]
                
                controller.passJudul = value["judul"] as! String
                controller.passKat = value["id_kategori"] as! String
                controller.passIsi = value["isi_wisatabali"] as! String
            }
        }
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
