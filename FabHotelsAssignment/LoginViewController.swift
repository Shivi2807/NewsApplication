//
//  LoginViewController.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 19/11/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        
        emailTextField.returnKeyType = .next
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        
        passwordTextField.delegate = self
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.returnKeyType = .go
    }
    
    @IBAction func loginPressed()
    {
        view.endEditing(true)
        print("Did press login")
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        let request = ValidateRequestModel(email: email, password: password)
        let validation = LoginValidation()
        let validationResult = validation.validate(request: request)
        
        if validationResult.success
        {
            APIManager.shared.getLoginDetailes { [weak self] success in
                if success
                {
                    DispatchQueue.main.async {
                        guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController else
                        {
                            return
                        }
                        self?.navigationController?.pushViewController(vc, animated: true)
                    }
                }
                else
                {
                    print("Could not get response from login api")
                }
            }
        }
        
        else
        {
            let alert = UIAlertController(title: "Oops", message: validationResult.errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
}

extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField
        {
            passwordTextField.becomeFirstResponder()
        }
        
        if textField == passwordTextField
        {
            loginPressed()
        }
        return true
    }
}
