//
//  AppSpacing.swift
//  DesignSystem
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import SwiftUI

public enum AppSpacing {

    // MARK: - Base Scale

    /// 0 pt
    public static let zero: CGFloat = 0
    /// 2 pt
    public static let xxxSmall: CGFloat = 2
    /// 4 pt
    public static let xxSmall: CGFloat = 4
    /// 8 pt
    public static let xSmall: CGFloat = 8
    /// 12 pt
    public static let small: CGFloat = 12
    /// 16 pt
    public static let medium: CGFloat = 16
    /// 20 pt
    public static let large: CGFloat = 20
    /// 24 pt
    public static let xLarge: CGFloat = 24
    /// 32 pt
    public static let xxLarge: CGFloat = 32
    /// 40 pt
    public static let xxxLarge: CGFloat = 40
    /// 48 pt
    public static let huge: CGFloat = 48
    /// 64 pt
    public static let massive: CGFloat = 64

    // MARK: - Screen Padding

    /// Horizontal padding for screen edges – 16 pt
    public static let screenHorizontal: CGFloat = medium
    /// Vertical padding for screen edges – 20 pt
    public static let screenVertical: CGFloat = large

    // MARK: - Card

    /// Inner padding for movie cards – 12 pt
    public static let cardPadding: CGFloat = small
    /// Spacing between cards in a list/grid – 12 pt
    public static let cardSpacing: CGFloat = small
    /// Corner radius for cards – 12 pt
    public static let cardCornerRadius: CGFloat = 12

    // MARK: - Poster

    /// Spacing between poster thumbnails – 8 pt
    public static let posterSpacing: CGFloat = xSmall
    /// Corner radius for poster images – 8 pt
    public static let posterCornerRadius: CGFloat = 8

    // MARK: - Section

    /// Vertical spacing between sections – 24 pt
    public static let sectionSpacing: CGFloat = xLarge
    /// Spacing between section header and content – 12 pt
    public static let sectionHeaderSpacing: CGFloat = small

    // MARK: - Buttons

    /// Vertical padding inside buttons – 12 pt
    public static let buttonVertical: CGFloat = small
    /// Horizontal padding inside buttons – 24 pt
    public static let buttonHorizontal: CGFloat = xLarge
    /// Corner radius for buttons – 8 pt
    public static let buttonCornerRadius: CGFloat = 8

    // MARK: - Genre Chips

    /// Vertical padding inside genre chips – 4 pt
    public static let chipVertical: CGFloat = xxSmall
    /// Horizontal padding inside genre chips – 12 pt
    public static let chipHorizontal: CGFloat = small
    /// Spacing between genre chips – 8 pt
    public static let chipSpacing: CGFloat = xSmall
    /// Corner radius for genre chips – 16 pt
    public static let chipCornerRadius: CGFloat = 16

    // MARK: - Icon Sizes

    /// Small icon size – 16 pt
    public static let iconSmall: CGFloat = 16
    /// Medium icon size – 24 pt
    public static let iconMedium: CGFloat = 24
    /// Large icon size – 32 pt
    public static let iconLarge: CGFloat = 32

    // MARK: - Divider

    /// Vertical margin around dividers – 8 pt
    public static let dividerVertical: CGFloat = xSmall
}
