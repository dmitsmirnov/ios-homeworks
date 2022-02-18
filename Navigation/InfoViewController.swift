//
//  InfoViewController.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 17.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var alertActionButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alertActionButton.layer.cornerRadius = 12
        
    }
    
    @IBAction func showAlertButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Внимание", message: "Тут могла быть ваша реклама", preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Жаль", comment: "Жаль"), style: .destructive, handler: { _ in})
        let confirmAction = UIAlertAction(title: NSLocalizedString("Бывает", comment: "Бывает"), style: .default, handler: { _ in})
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
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
