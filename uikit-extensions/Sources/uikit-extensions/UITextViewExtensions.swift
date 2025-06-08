//
//  UITextView + Extensions.swift
//  uikit-extensions
//
//  Created by Andrey Barsukov on 01.06.2025.
//

import UIKit

// MARK: - UITextView + Extensions

extension UITextView {
    
    /// Obtains the size of the text
    /// - Parameter width: textView width
    /// - Returns: text size
  public func sizeFit(width: CGFloat) -> CGSize {
        let fixedWidth = width
        let newSize = sizeThatFits(CGSize(width: fixedWidth, height: .greatestFiniteMagnitude))
        return CGSize(width: fixedWidth, height: newSize.height)
    }
    
    /// Obtains number of lines for the whole text
    /// - Returns: number of lines
   public func numberOfLine() -> Int {
        let size = self.sizeFit(width: self.bounds.width)
        let numLines = Int(size.height / (self.font?.lineHeight ?? 1.0))
        return numLines
    }
}
