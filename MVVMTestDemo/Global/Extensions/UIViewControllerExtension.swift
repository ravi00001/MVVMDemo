//
//  UIViewControllerExtension.swift
//  JennyCraig
//
//  Created by Mobileprogrammingllc on 7/5/18.
//  Copyright © 2018 JennyCraig. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func popupAlert(title: String?, message: String?, actionTitles: [String?], actions: [((UIAlertAction) -> Void)?]) {

        if message == "" {
            return
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {

    class func displaySpinner(onView: UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        indicator.startAnimating()
        indicator.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }

        return spinnerView
    }

    class func removeSpinner(spinner: UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}

 extension UIAlertController {
    func show() {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        win.rootViewController = viewController
        win.windowLevel = UIWindowLevelAlert + 1
        win.makeKeyAndVisible()
        viewController.present(self, animated: true, completion: nil)
    }

}
