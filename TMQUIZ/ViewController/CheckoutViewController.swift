//
//  CheckoutViewController.swift
//  TMQUIZ
//
//  Created by Rashad Wardhana on 15/10/20.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet var QtyOne: UILabel!
    @IBOutlet var QtyTwo: UILabel!
    @IBOutlet var QtyThree: UILabel!
    @IBOutlet var totalPrice: UILabel!
    @IBOutlet var txtTotalStatement: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        QtyOne.text = String(cartDataUniversal[0].quantity)
        QtyTwo.text = String(cartDataUniversal[1].quantity)
        QtyThree.text = String(cartDataUniversal[2].quantity)
        
        let calculate = (cartDataUniversal[0].quantity * cartDataUniversal[0].price) + (cartDataUniversal[1].quantity * cartDataUniversal[1].price) + (cartDataUniversal[2].quantity * cartDataUniversal[2].price)
        let totalItem = (cartDataUniversal[0].quantity + cartDataUniversal[1].quantity + cartDataUniversal[2].quantity)
//
        totalPrice.text = "Rp" + String(calculate)
        
        txtTotalStatement.text = "Total \(totalItem) item(s)"
    }
    
    
    
    @IBAction func btnCheckout(_ sender: Any) {
        let alert = UIAlertController(title: "Success Buy", message: "Thanks for buying, total is \(totalPrice.text!)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler:{
            action in
            self.performSegue(withIdentifier: "backToHome", sender: self)
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToHome"{
            cartDataUniversal[0].quantity = 0
            cartDataUniversal[1].quantity = 0
            cartDataUniversal[2].quantity = 0
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
