//
//  UIViewController + Extensions.swift
//  uikit-extensions
//
//  Created by Andrey Barsukov on 01.06.2025.
//

import UIKit

// MARK: - UIViewController + Extensions

public extension UIViewController {

    // MARK: - Navigation Bar Appearance

    /// Configures the navigation bar to be completely transparent.
    /// - Note: This affects the current view controller's navigation controller.
    /// - Warning: Remember to call `resetClearNavigationBar()` when leaving the view controller.
    func setupClearNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }

    /// Resets the navigation bar to its default appearance.
    /// - Note: This should typically be called in `viewWillDisappear`.
    func resetClearNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }

    // MARK: - Keyboard Handling

    /// Adds a tap gesture recognizer to dismiss the keyboard when tapping outside text fields.
    /// - Note: Doesn't cancel other touches in the view.
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    /// Adds a pan gesture recognizer to dismiss the keyboard when swiping down.
    /// - Note: Doesn't cancel other touches in the view.
    func hideKeyboardWhenSwipedDown() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        pan.cancelsTouchesInView = false
        view.addGestureRecognizer(pan)
    }

    /// Dismisses the keyboard by ending editing in the view hierarchy.
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
