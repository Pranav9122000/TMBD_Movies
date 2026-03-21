//
//  AppFonts.swift
//  DesignSystem
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import Foundation
import SwiftUI
import CoreText

public enum AppFonts: String, CaseIterable {
    case courierNew = "Courier New"
    case courierNewBold = "Courier New Bold"
    case courierNewItalic = "Courier New Italic"
    case courierNewBoldItalic = "Courier New Bold Italic"

    public var fileName: String {
        switch self {
        case .courierNew:
            return "Courier New"
        case .courierNewBold:
            return "Courier New Bold"
        case .courierNewItalic:
            return "Courier New Italic"
        case .courierNewBoldItalic:
            return "Courier New Bold Italic"
        }
    }

    public var fileExtension: String { "ttf" }

    // MARK: - Font Registration

    public static func registerAllFonts() {
        for font in AppFonts.allCases {
            font.register()
        }
    }

    private func register() {
        guard let url = Bundle.module.url(forResource: fileName, withExtension: fileExtension, subdirectory: "Fonts") else {
            print("⚠️ Failed to locate font file: \(fileName).\(fileExtension)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error) {
            print("⚠️ Failed to register font: \(fileName). Error: \(String(describing: error?.takeRetainedValue()))")
        }
    }

    // MARK: - Font Accessors

    public func font(size: CGFloat) -> Font {
        .custom(rawValue, size: size)
    }

    public static func courierNew(size: CGFloat) -> Font {
        AppFonts.courierNew.font(size: size)
    }

    public static func courierNewBold(size: CGFloat) -> Font {
        AppFonts.courierNewBold.font(size: size)
    }

    public static func courierNewItalic(size: CGFloat) -> Font {
        AppFonts.courierNewItalic.font(size: size)
    }

    public static func courierNewBoldItalic(size: CGFloat) -> Font {
        AppFonts.courierNewBoldItalic.font(size: size)
    }
}

