//
//  IsiBeritaViewController.swift
//  FunstripBali
//
//  Created by Becak Holic on 11/25/17.
//  Copyright © 2017 Sam Pramudana. All rights reserved.
//

import UIKit

class IsiBeritaViewController: UIViewController {

    @IBOutlet weak var textIsi: UITextView!
    @IBOutlet weak var labelKategori: UILabel!
    @IBOutlet weak var labelJudul: UILabel!
    
    var passJudul:String?
    var passKat:String?
    var passIsi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelJudul.text = passJudul
        labelKategori.text = passKat
        textIsi.text = passIsi

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
