//
//  BeritaKategoriTableViewController.swift
//  FunstripBali
//
//  Created by Becak Holic on 11/25/17.
//  Copyright © 2017 Sam Pramudana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BeritaKategoriTableViewController: UITableViewController {
    
    var selectedIsi:String?
    var selecetedKat:String?
    var selectedJudul:String?
    
    var nampungId : String? = nil
    var arrayberita = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("id + " + nampungId!)
        
        let params = ["id_kat" : nampungId!]
        let url = "http://localhost/WisataBali/index.php/api/getWisataByIdKategori"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            
            //check response
            if response.result.isSuccess {
                //kalau response success kita ambil JSON
                let json = JSON(response.result.value as Any)
                print(json)
                //get jsonarray dari json diatas
                self.arrayberita = json["data"].arrayObject as! [[String:String]]
                //check di log
                //check jumlah array
                if(self.arrayberita.count > 0){
                    //refresh tableView
                    self.tableView.reloadData()
                }
            }
            else{
                print("error server")
            }
        })
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
        return arrayberita.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellBeritaKategori", for: indexPath) as! BeritaKategoriTableViewCell

        // Configure the cell...
        var serverid = arrayberita[indexPath.row]
        
        var id = serverid["id_wisatabali"]
        let judul = serverid["judul"]
        let nama_kategori = serverid["nama_kategori"]
        let isiBerita = serverid["isi_wisatabali"]
        
        cell.labelJudul.text = judul
        cell.labelIsi.text = isiBerita
        cell.labelKategori.text = nama_kategori

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrayberita[indexPath.row]
        selectedJudul = task["judul"] as! String
        selectedIsi = task["isi_wisatabali"] as! String
        selecetedKat = task["id_kategori"] as! String
        
        performSegue(withIdentifier: "passDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! IsiDetailViewController
                let value = arrayberita[indexPath.row]
                
                controller.judulPass = value["judul"] as! String
                controller.isitextPass = value["isi_wisatabali"] as! String
                controller.kategoriPass = value["id_kategori"] as! String
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
