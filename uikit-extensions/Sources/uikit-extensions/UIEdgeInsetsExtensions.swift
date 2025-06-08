//
//  UIEdgeInsets + Extensions.swift
//  uikit-extensions
//
//  Created by Andrey Barsukov on 01.06.2025.
//

import UIKit

// MARK: - UIEdgeInsets + Extensions

public extension UIEdgeInsets {

    // MARK: - Instance Methods

    /// Returns new insets with updated bottom value while preserving other edges.
    /// - Parameter bottom: The new bottom inset value.
    /// - Returns: New UIEdgeInsets with modified bottom value.
    func bottom(_ bottom: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    /// Returns new insets with updated top value while preserving other edges.
    /// - Parameter top: The new top inset value.
    /// - Returns: New UIEdgeInsets with modified top value.
    func top(_ top: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    /// Returns new insets with updated left value while preserving other edges.
    /// - Parameter left: The new left inset value.
    /// - Returns: New UIEdgeInsets with modified left value.
    func left(_ left: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    /// Returns new insets with updated right value while preserving other edges.
    /// - Parameter right: The new right inset value.
    /// - Returns: New UIEdgeInsets with modified right value.
    func right(_ right: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    /// Returns new insets with updated horizontal (left and right) values while preserving vertical edges.
    /// - Parameter horizontal: The new horizontal inset value (applied to both left and right).
    /// - Returns: New UIEdgeInsets with modified horizontal values.
    func horizontal(_ horizontal: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: top, left: horizontal, bottom: bottom, right: horizontal)
    }

    // MARK: - Static Methods

    /// Creates insets with equal values on all edges.
    /// - Parameter inset: The value to use for all edges.
    /// - Returns: UIEdgeInsets with equal inset values.
    static func equal(inset: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    /// Creates insets with only bottom inset specified (other edges are zero).
    /// - Parameter bottom: The bottom inset value.
    /// - Returns: UIEdgeInsets with only bottom inset.
    static func bottom(_ bottom: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets.zero.bottom(bottom)
    }

    /// Creates insets with only top inset specified (other edges are zero).
    /// - Parameter top: The top inset value.
    /// - Returns: UIEdgeInsets with only top inset.
    static func top(_ top: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets.zero.top(top)
    }

    /// Creates insets with only left inset specified (other edges are zero).
    /// - Parameter left: The left inset value.
    /// - Returns: UIEdgeInsets with only left inset.
    static func left(_ left: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets.zero.left(left)
    }

    /// Creates insets with only right inset specified (other edges are zero).
    /// - Parameter right: The right inset value.
    /// - Returns: UIEdgeInsets with only right inset.
    static func right(_ right: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets.zero.right(right)
    }

    /// Creates insets with equal horizontal (left and right) insets (top and bottom are zero).
    /// - Parameter horizontal: The horizontal inset value.
    /// - Returns: UIEdgeInsets with equal horizontal insets.
    static func horizontal(_ horizontal: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets.zero.left(horizontal).right(horizontal)
    }

    // MARK: - Computed Properties

    /// The total horizontal inset (left + right).
    var horizontalInset: CGFloat {
        left + right
    }

    /// The total vertical inset (top + bottom).
    var verticalInset: CGFloat {
        top + bottom
    }
}
