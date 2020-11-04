//
//  NovelItemViewController.swift
//  TMQUIZ
//
//  Created by Rashad Wardhana on 16/10/20.
//

import UIKit

var finalQuantity:String?
                        
class NovelItemViewController: UIViewController {

    @IBOutlet var txtNovelName: UILabel!
    @IBOutlet var txtNovelPrice: UILabel!
    @IBOutlet var txtNovelQty: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var name:String?
    var imgView:String?
    var price:Int?
    var quantity:Int?
    var itemIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: imgView!)
        txtNovelName.text = "\(name!)"
        txtNovelQty.text = "\(quantity!)"
        txtNovelPrice.text = "\(price!)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtNovelQty.text = String(cartDataUniversal[itemIndex].quantity)
    }
    
    @IBAction func stepperQty(_ sender: UIStepper) {
        txtNovelQty.text = String(sender.value)
        let tempQty = Int(sender.value)
        cartDataUniversal[itemIndex].quantity = tempQty
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
