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
    @IBOutlet var restoreUserButton: UIButton!
    @IBOutlet var restorePasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTextField()
        setupLoginbutton()
    }
    
    //MARK: Set up login & password textfield
    func setUpTextField() {
        // userNameTextField
        let userNameImage = UIImage(systemName: "person")
        guard let userNameImage = userNameImage else {return}
        
        userNameTextField.leftImage(userNameImage, imageWidth: 20, padding: 8)
        
        userNameTextField.text = "Name"
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.layer.borderWidth = 1
        
        // userPasswordTextField
        let userPasswordImage = UIImage(systemName: "lock")
        guard let userPasswordImage = userPasswordImage else {return}
        
        userPasswordTextField.leftImage(userPasswordImage, imageWidth: 20, padding: 8)

        userPasswordTextField.text = "Password"
        userPasswordTextField.borderStyle = .roundedRect
        userPasswordTextField.layer.cornerRadius = 5
        userPasswordTextField.layer.borderWidth = 1
        
    }
    
    
    //MARK: Set up login button
    func setupLoginbutton() {
        loginButton.layer.cornerRadius = 10
    }

    
    @IBAction func loginButtonAction() {
    }
    
    @IBAction func restoreUserName() {
    }
    
    @IBAction func restoreUserPassword() {
    }
    
}


extension ViewController: UITextFieldDelegate {
    
}

//MARK: Create left side icon with padding for textfield
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

