//
//  PaymentRouter.swift
//  Merchant
//
//  Created by Jean-Baptiste Dominguez on 2018/10/18.
//  Copyright © 2018 Bitcoin.com. All rights reserved.
//

import UIKit

class PaymentRouter: BDCRouter {
    func transitToPaymentDetail(_ pr: PaymentRequest) {
        let paymentRequestViewController = PaymentRequestBuilder().provide(pr)
        let navViewController = UINavigationController(rootViewController: paymentRequestViewController)
        viewController?.present(navViewController, animated: true, completion: nil)
    }
}