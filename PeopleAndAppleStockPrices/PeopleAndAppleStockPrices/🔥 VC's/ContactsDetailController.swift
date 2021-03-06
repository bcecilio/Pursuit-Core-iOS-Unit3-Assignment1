//
//  ContactsDetailController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Brendon Cecilio on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsDetailController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var contactDetail: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let contactInfo = contactDetail else {
            fatalError("check segue!")
        }
        nameLabel.text = contactInfo.fullName.capitalized
        addressLabel.text = contactInfo.location.street.capitalized
        phoneLabel.text = contactInfo.phone
        emailLabel.text = contactInfo.email
        
        ImageClient.fetchImage(for: contactDetail.picture.large) { [unowned self] (result) in
            switch result {
            case .failure(let error):
                print("error \(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.profileImage.image = image
                }
            }
        }
    }
}
