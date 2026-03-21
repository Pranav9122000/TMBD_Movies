//
//  AppColors.swift
//  DesignSystem
//
//  Created by Pranav.kulkarni on 20/03/26.
//

import SwiftUI

public enum AppColors {
    
    // MARK: - Backgrounds
    public static let background = Color(hex: "#0D0D0D")
    public static let backgroundElevated = Color(hex: "#1A1A2E")
    public static let surface = Color(hex: "#16213E")
    public static let surfaceLight = Color(hex: "#1F2B47")
    
    // MARK: - Accent / Brand
    public static let primary = Color(hex: "#E50914")  // Netflix-style red
    public static let primaryVariant = Color(hex: "#B20710")
    public static let secondary = Color(hex: "#F5C518")  // IMDb gold
    public static let secondaryVariant = Color(hex: "#D4A90A")
    public static let accent = Color(hex: "#01D277")  // TMDB green
    
    // MARK: - Text
    public static let textPrimary = Color(hex: "#EAEAEA")
    public static let textSecondary = Color(hex: "#A0A0A0")
    public static let textMuted = Color(hex: "#6C6C6C")
    public static let textOnPrimary = Color(hex: "#FFFFFF")
    
    // MARK: - Rating / Stars
    public static let ratingHigh = Color(hex: "#21D07A")  // TMDB green score
    public static let ratingMedium = Color(hex: "#D2D531")  // Yellow score
    public static let ratingLow = Color(hex: "#DB2360")  // Red score
    
    // MARK: - UI Elements
    public static let divider = Color(hex: "#2A2A2A")
    public static let cardBackground = Color(hex: "#1C1C2B")
    public static let searchBar = Color(hex: "#2C2C3A")
    public static let shimmer = Color(hex: "#2A2A3D")
    public static let overlay = Color.black.opacity(0.6)
    
    // MARK: - Genres (Tag chips)
    public static let genreBackground = Color(hex: "#2E2E45")
    public static let genreBorder = Color(hex: "#4A4A65")
    
    // MARK: - Status
    public static let success = Color(hex: "#4CAF50")
    public static let warning = Color(hex: "#FF9800")
    public static let error = Color(hex: "#F44336")
}

// MARK: - Hex Color Initializer

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

