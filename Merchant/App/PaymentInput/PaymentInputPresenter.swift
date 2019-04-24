//
//  PaymentInputPresenter.swift
//  Merchant
//
//  Created by Jean-Baptiste Dominguez on 2018/11/14.
//  Copyright © 2018 Bitcoin.com. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class PaymentInputPresenter {
    
    var router: PaymentInputRouter?
    weak var viewDelegate: PaymentInputViewController?
    
    var selectedCurrency: StoreCurrency
    
    init() {
        selectedCurrency = UserManager.shared.selectedCurrency
    }
    
    func viewDidLoad() {
    }
    
    func setAmount(_ amount: String) {
        // TODO: Manage the rate here
        let amountStr = amount.toFormat("USD", strict: true)
        viewDelegate?.onGetAmount(amountStr)
    }
    
    func didPushValid(_ amount: String) {
        // TODO: Calculate amount of Satoshis
        // Create payment request
        let destination = UserManager.shared.destination
        guard let address = try? destination.toCashAddress() else {
            // TODO: Handle the error here with a message
            return
        }
        
        // TODO: Calcul du montant en satoshis
        //
        
        let pr = PaymentRequest(toAddress: address, amountInSatoshis: 1000, amountInCurrency: 10.10)
        router?.transitToPaymentDetail(pr)
    }
}