//
//  EmailValidator.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 18.04.2022.
//

import UIKit

public func isValidEmail(email: String) -> Bool {
    let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailCheck = NSPredicate(format: "SELF MATCHES %@", emailReg)
    return emailCheck.evaluate(with: email)
}
