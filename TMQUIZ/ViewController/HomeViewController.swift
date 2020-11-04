//
//  HomeViewController.swift
//  TMQUIZ
//
//  Created by Rashad Wardhana on 15/10/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var txtWelcome: UILabel!
    @IBOutlet var btnProfile: UIButton!
    @IBOutlet var btnBuy: UIButton!
    @IBOutlet var btnLogout: UIButton!
    
    @IBOutlet var labelTesting: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtWelcome.text = "Welcome, " + dataUniversal!.username + "!"
    }
    
    func initData(){
        cartDataUniversal.append(CartData(novel: "Yosagu", price: 20000, quantity: 0, imgThumbnail: "yosagu"))
        cartDataUniversal.append(CartData(novel: "Dilan 1990", price: 10000, quantity: 0, imgThumbnail: "dilan"))
        cartDataUniversal.append(CartData(novel: "Soramu", price: 20000, quantity: 0, imgThumbnail: "soramu"))
    }
    
    @IBAction func btnProfile(_ sender: Any) {
        performSegue(withIdentifier: "goToProfile", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        initData()
        if segue.identifier == "novelItem1"{
            let dest = segue.destination as! NovelItemViewController
            dest.name = cartDataUniversal[0].novel
            dest.price = cartDataUniversal[0].price
            dest.quantity = cartDataUniversal[0].quantity
            dest.imgView = cartDataUniversal[0].imgThumbnail
            dest.itemIndex = 0
        }else if segue.identifier == "novelItem2"{
            let dest = segue.destination as! NovelItemViewController
            dest.name = cartDataUniversal[1].novel
            dest.price = cartDataUniversal[1].price
            dest.quantity = cartDataUniversal[1].quantity
            dest.imgView = cartDataUniversal[1].imgThumbnail
            dest.itemIndex = 1
        }else if segue.identifier == "novelItem3"{
            let dest = segue.destination as! NovelItemViewController
            dest.name = cartDataUniversal[2].novel
            dest.price = cartDataUniversal[2].price
            dest.quantity = cartDataUniversal[2].quantity
            dest.imgView = cartDataUniversal[2].imgThumbnail
            dest.itemIndex = 2
        }
    }
    @IBAction func btnBuy(_ sender: Any) {
        performSegue(withIdentifier: "goToBuy", sender: self)
    }
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        if unwindSegue.identifier == "backToHome"{
            
        }
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
