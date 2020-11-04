//
//  ProfileViewController.swift
//  TMQUIZ
//
//  Created by Rashad Wardhana on 15/10/20.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var txtProfileUsername: UILabel!
    @IBOutlet var txtProfileDoB: UILabel!
    @IBOutlet var txtProfileGender: UILabel!
    @IBOutlet var txtProfileEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtProfileUsername.text = dataUniversal?.username
        txtProfileDoB.text = String(dataUniversal!.date) + " " + String(dataUniversal!.month) + " " + String(dataUniversal!.year)
        txtProfileGender.text = dataUniversal?.gender
        txtProfileEmail.text = dataUniversal?.email
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
