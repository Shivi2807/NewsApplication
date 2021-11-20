//
//  LoginValidation.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 20/11/21.
//

import Foundation

struct LoginValidation
{
    func validate(request: ValidateRequestModel) -> ValidationResultModel
    {
        if (!request.email.isEmpty && !request.password.isEmpty && request.password.count >= 6)
        {
            if request.email.validateEmail()
            {
                return ValidationResultModel(success: true, errorMessage: nil)
            }
            
            else
            {
                return ValidationResultModel(success: false, errorMessage: "Invalid email")
            }
        }
        return ValidationResultModel(success: false, errorMessage: "Either email or password field is empty or count of password is less that 5 characters")
    }
}
