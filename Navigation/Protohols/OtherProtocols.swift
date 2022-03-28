//
//  OtherProtocols.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 25.03.2022.
//

import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
    var isHeaderViewExpanded: Bool { get set }
    //func updateTable()
}

protocol ProfileViewControllerDelegate: AnyObject {
    func myTest()
}
