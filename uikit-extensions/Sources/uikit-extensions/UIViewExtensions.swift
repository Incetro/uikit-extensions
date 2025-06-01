//
//  UIViewExtensions.swift
//  uikit-extensions
//
//  Created by Andrey Barsukov on 01.06.2025.
//


import UIKit
import Layout

// MARK: - UIView

public extension UIView {

    // MARK: - Corner Rounding

    /// Applies smooth rounded corners to the view with specified parameters.
    ///
    /// - Parameters:
    ///   - corners: The corners to round (default: all corners)
    ///   - radius: The corner radius to apply
    ///   - rect: Optional custom rectangle to use for rounding (default: view's bounds)
    func smoothlyRoundCourners(
        _ corners: UIRectCorner = .allCorners,
        radius: CGFloat,
        inRect rect: CGRect? = nil
    ) {
        let roundedRect = rect ?? bounds
        guard roundedRect.size != .zero else { return }
        
        let roundPath = UIBezierPath(
            roundedRect: roundedRect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        layer.mask = maskLayer
    }

    // MARK: - View Wrapping

    /// Wraps the view in a new container view with full edge constraints.
    ///
    /// - Parameter insets: The insets to apply between the view and its container
    /// - Returns: The new container view containing the original view
    func wrapped(withInsets insets: UIEdgeInsets) -> Self {
        prepareForAutolayout()
        let wrapper = Self()
        wrapper.addSubview(self)
        fullPinToSuperview(withInsets: insets)
        return wrapper
    }

    /// Wraps the view in a new container view with safe edge constraints.
    /// Only applies constraints for insets that are not zero.
    ///
    /// - Parameter insets: The insets to apply between the view and its container
    /// - Returns: The new container view containing the original view
    func safelyWrapped(withInsets insets: UIEdgeInsets) -> Self {
        prepareForAutolayout()
        let wrapper = Self()
        wrapper.addSubview(self)
        safePin(to: wrapper, withInsets: insets)
        return wrapper
    }

    // MARK: - Subview Utilities

    /// Returns all subviews of the specified type.
    ///
    /// - Parameter type: The type of subviews to find
    /// - Returns: An array of subviews matching the specified type
    func subviews<T: UIView>(ofType type: T.Type) -> [T] {
        subviews.compactMap { $0 as? T }
    }

    // MARK: - Animation

    /// Performs a shake animation on the view.
    ///
    /// - Parameters:
    ///   - direction: The direction of the shake (default: horizontal)
    ///   - duration: The duration of the animation in seconds (default: 0.62)
    ///   - animationType: The timing function for the animation (default: easeOut)
    ///   - completion: Optional closure to execute when animation completes
    func shake(
        direction: ShakeDirection = .horizontal,
        duration: TimeInterval = 0.62,
        animationType: ShakeAnimationType = .easeOut,
        completion: (() -> Void)? = nil
    ) {
        CATransaction.begin()
        let animation: CAKeyframeAnimation
        switch direction {
        case .horizontal:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        case .vertical:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        }
        
        switch animationType {
        case .linear:
            animation.timingFunction = CAMediaTimingFunction(name: .linear)
        case .easeIn:
            animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        case .easeOut:
            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        case .easeInOut:
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        }
        
        CATransaction.setCompletionBlock(completion)
        animation.duration = duration
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0]
        layer.add(animation, forKey: "shake")
        CATransaction.commit()
    }

    // MARK: - Rotation Animation

    private static let kRotationAnimationKey = "rotationanimationkey"
    
    /// Starts an infinite rotation animation on the view.
    ///
    /// - Parameter duration: The duration of one full rotation in seconds (default: 1)
    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    
    /// Stops any ongoing rotation animation on the view.
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }

    // MARK: - Enums

    /// The direction of shake animation.
    enum ShakeDirection {
        /// Horizontal shake (left and right)
        case horizontal
        /// Vertical shake (up and down)
        case vertical
    }

    /// The timing function for shake animation.
    enum ShakeAnimationType {
        /// Linear animation
        case linear
        /// Ease-in animation
        case easeIn
        /// Ease-out animation
        case easeOut
        /// Ease-in-ease-out animation
        case easeInOut
    }
}
