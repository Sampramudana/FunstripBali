//
//  IsiDetailViewController.swift
//  FunstripBali
//
//  Created by Becak Holic on 11/25/17.
//  Copyright © 2017 Sam Pramudana. All rights reserved.
//

import UIKit

class IsiDetailViewController: UIViewController {

    @IBOutlet weak var isiText: UITextView!
    @IBOutlet weak var kategoriLabel: UILabel!
    @IBOutlet weak var judulLabel: UILabel!
    
    var judulPass:String?
    var kategoriPass:String?
    var isitextPass:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        judulLabel.text = judulPass
        kategoriLabel.text = kategoriPass
        isiText.text = isitextPass
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
