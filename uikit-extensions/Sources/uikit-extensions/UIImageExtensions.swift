//
//  UIImageExtensions.swift
//  uikit-extensions
//
//  Created by Andrey Barsukov on 31.05.2025.
//

import UIKit

// MARK: - UIImage

extension UIImage {

    // MARK: - System Images
    
    /// Creates and returns a system symbol image with the specified name.
    ///
    /// - Parameter systemName: The name of the system symbol image.
    /// - Returns: The requested system symbol image.
    /// - Important: Will force unwrap the result, so ensure the system name is valid.
    ///
    /// Example:
    /// ```
    /// let image = UIImage.system("heart.fill")
    /// ```
    static func system(_ systemName: String) -> UIImage {
        UIImage(systemName: systemName).unsafelyUnwrapped
    }
    
    // MARK: - Image Saving
    
    /// Saves the image as JPEG in the temporary directory and returns its URL.
    ///
    /// - Parameter imagePath: The path component for the saved image file.
    /// - Returns: The URL of the saved image file, or nil if saving fails.
    ///
    /// Example:
    /// ```
    /// if let url = image.saveAndExtractImageURL(with: "avatar.jpg") {
    ///     print("Image saved at: \(url)")
    /// }
    /// ```
    public func saveAndExtractImageURL(with imagePath: String) -> URL? {
        guard let data = self.jpegData(compressionQuality: 0.99) else {
            return nil
        }
        let tempURL = FileManager.default.temporaryDirectory
        let fileURL = tempURL.appendingPathComponent(imagePath)
        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            return nil
        }
    }
}
