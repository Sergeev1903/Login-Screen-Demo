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
    
    //MARK: IBACTIONS
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        print("Access is allowed")
        showErrorLoginAlert()
    }
    
    @IBAction func restoreUserName() {
        showUserName()
    }
    
    @IBAction func restoreUserPassword() {
        showUserPassword()
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
    
    
    //MARK: TEXTFIELD ACCESS
    
    private  func accesUserNameTextField() {
        
        guard userNameTextField.text?.isEmpty == false else {return showErrorEmptyTextField()}
        guard let userName = userNameTextField.text else {return}
        if userName == dataBaseUser1.dataUser.userName {
            print("User name: \(userName)")
        }
    }
    
    private func accesUserPasswordTextField() {
        
        guard userPasswordTextField.text?.isEmpty == false else {return showErrorEmptyTextField()}
        guard let userPassword = userPasswordTextField.text else {return}
        if userPassword == dataBaseUser1.dataUser.userPassword  {
            print("User name: \(userPassword)")
        }
    }
    
    
    //MARK: ALERTS
    
    private func showErrorLoginAlert() {
        
        let alert = UIAlertController(title: "Wrong user name or password",
                                      message: "Please enter correct value",
                                      preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func showErrorEmptyTextField() {
        
        let alert = UIAlertController(title: "Text Field is empty",
                                      message: "Fill in the field",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func showUserName() {
        
        let alert = UIAlertController(title: "User Name",
                                      message: "\(dataBaseUser1.dataUser.userName)",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func showUserPassword() {
        
        let alert = UIAlertController(title: "User Password ",
                                      message: "\(dataBaseUser1.dataUser.userPassword)",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}


//MARK: EXTENSIONS

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
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

