//
//  LoginApIResponse.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 20/11/21.
//

import Foundation

struct LoginAPIResponse : Decodable{
    let token: String
    let full_name: String
}
