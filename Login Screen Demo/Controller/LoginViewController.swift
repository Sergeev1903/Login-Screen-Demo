//
//  ViewController.swift
//  Login Screen Demo
//
//  Created by Артем Сергеев on 26.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var userPasswordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTextField()
        setupLoginbutton()
        
    }
    
    //MARK: NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "login" else {return}
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userName = userNameTextField.text
    }
    
    //MARK: IBACTIONS
    
    @IBAction func loginButtonAction() {
        
        guard
            userNameTextField.text?.isEmpty == false,
            let userName = userNameTextField.text
        else {
            showAlert(title: "Empty Field", message: "Enter user name", style: .alert)
            return
        }
        
        guard
            userPasswordTextField.text?.isEmpty == false,
            let userPassword = userPasswordTextField.text
        else {
            showAlert(title: "Empty Field", message: "Enter user password", style: .alert)
            return
        }
        
        if userName == dataBaseUser1.dataUser.userName,
           userPassword == dataBaseUser1.dataUser.userPassword {
            print("User name: \(userName)")
            print("User password: \(userPassword)")
            print("Access is allowed")
        } else {
            showAlert(title: "Wrong user name or password",
                      message: "Please enter correct value",
                      style: .actionSheet)
        }
        
        performSegue(withIdentifier: "login", sender: nil)
        
    }
    
    @IBAction func restoreUserName() {
        showAlert(title: "User name",
                  message: "\(dataBaseUser1.dataUser.userName)",
                  style: .alert)
    }
    
    @IBAction func restoreUserPassword() {
        showAlert(title: "User password",
                  message: "\(dataBaseUser1.dataUser.userPassword)",
                  style: .alert)
    }
    
    
    //MARK: SETUPS
    
    // Set up login & password textfield
    private func setUpTextField() {
        
        // userNameTextField
        let userNameImage = UIImage(systemName: "person")
        guard let userNameImage = userNameImage else {return}
        
        userNameTextField.leftImage(userNameImage, imageWidth: 0, padding: 16)
        userNameTextField.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.layer.borderWidth = 1
        
        // userPasswordTextField
        let userPasswordImage = UIImage(systemName: "lock")
        guard let userPasswordImage = userPasswordImage else {return}
        
        userPasswordTextField.leftImage(userPasswordImage, imageWidth: 0, padding: 16)
        userPasswordTextField.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        userPasswordTextField.borderStyle = .roundedRect
        userPasswordTextField.layer.cornerRadius = 5
        userPasswordTextField.layer.borderWidth = 1
    }
    
    // Set up login button
    private  func setupLoginbutton() {
        
        loginButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loginButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 5
        
    }
    
    
    //MARK: ALERTS
    
    private func showAlert(title: String, message: String, style: UIAlertController.Style) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: style)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
 
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        userPasswordTextField.text = nil
    }
}


//MARK: EXTENSIONS

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            userPasswordTextField.becomeFirstResponder()
        } else {
            loginButtonAction()
        }
        return true
    }
}


//Create left side icon with padding for textfield
extension UITextField {
    
    func leftImage(_ image: UIImage?, imageWidth: CGFloat, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: padding, y: 0, width: imageWidth, height: frame.height)
        imageView.contentMode = .center
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageWidth + 2 * padding, height: frame.height))
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = .always
    }
}

