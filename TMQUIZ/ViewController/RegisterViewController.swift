//
//  RegisterViewController.swift
//  TMQUIZ
//
//  Created by Rashad Wardhana on 15/10/20.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var StepperGender: UISegmentedControl!
    @IBOutlet var txtDate: UITextField!
    @IBOutlet var txtMonth: UITextField!
    @IBOutlet var txtYear: UITextField!

//    var data:UserData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.isSecureTextEntry = true
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    func checkEmptyFields() -> Int{
        let username:String = txtUsername.text!
        let email:String = txtEmail.text!
        let password:String = txtPassword.text!
        let date:String = txtDate.text!
        let month:String = txtMonth.text!
        let year:String = txtYear.text!
        
        if (username.isEmpty || email.isEmpty || password.isEmpty ||
                date.isEmpty || month.isEmpty || year.isEmpty){
            return 1
        }
        return 0
    }
    
    func usernameValidation() -> Int{
        let username:String = txtUsername.text!
        
        if (username.count < 4 || username.count > 12){
            return 1
        }
        return 0
    }
    func passwordValidation() -> Int{
        let password:String = txtPassword.text!
        
        if (password.count < 4 || password.count > 12){
            return 1
        }
        return 0
    }
    func emailValidation() -> Int{
        let email:String = txtEmail.text!
        
        if ((!email.contains("@") || !email.contains(".com")) || email.contains("@.")){
            return 1
        }
        return 0
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let emptyAlert = UIAlertController(title: "Required fields cannot be empty", message: "Please fill in the blanks", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        emptyAlert.addAction(okAction)
        let UsernameAlert = UIAlertController(title: "Username is incorrect", message: "Minimum length: 4, maximum length: 12 ", preferredStyle: .alert)
        UsernameAlert.addAction(okAction)
        let passwordAlert = UIAlertController(title: "Password is incorrect", message: "Minimum length: 4, maximum length: 12 ", preferredStyle: .alert)
        passwordAlert.addAction(okAction)
        let emailAlert = UIAlertController(title: "Email is incorrect", message: "Email must contain @ and .com, but cannot @.com", preferredStyle: .alert)
        emailAlert.addAction(okAction)
        
        if checkEmptyFields() == 1 {
            present(emptyAlert, animated: true, completion: nil)
        }else if usernameValidation() == 1{
            present(UsernameAlert, animated: true, completion: nil)
        }else if passwordValidation() == 1{
            present(UsernameAlert, animated: true, completion: nil)
        }else if emailValidation() == 1{
            present(emailAlert, animated: true, completion: nil)
        }else{
            let username:String = txtUsername.text!
            let email:String = txtEmail.text!
            let password:String = txtPassword.text!
            let date:String = txtDate.text!
            let month:String = txtMonth.text!
            let year:String = txtYear.text!
            let gender:String? = StepperGender.titleForSegment(at: StepperGender.selectedSegmentIndex)
            dataUniversal = UserData(username: username, email: email, password: password, date: date, month: month, year: year, gender: gender!)
            performSegue(withIdentifier: "goToHome", sender: self)
        }
    }
    
    @IBAction func unwindToThis(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
//        if let source = unwindSegue.source as? HomeViewController{
            txtUsername.text = ""
            txtEmail.text = ""
            txtDate.text = ""
            txtYear.text = ""
            txtPassword.text = ""
            txtMonth.text = ""
//        }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
