import SwiftUI
import Domain
import DesignSystem

struct MoviesCardView: View {
    let movie: MovieEntity
    var onTap: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: AppSpacing.medium) {
            
            // MARK: - Poster Image
            if let posterPath = movie.posterPath,
               let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .fill(AppColors.shimmer)
                            .overlay(ProgressView().tint(AppColors.primary))
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        fallbackPoster
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: AppSpacing.posterCornerRadius))
            } else {
                fallbackPoster
            }
            
            // MARK: - Movie Details
            VStack(alignment: .leading, spacing: AppSpacing.xxSmall) {
                Text(movie.title ?? "Unknown Title")
                    .font(AppFonts.courierNewBold(size: 18))
                    .foregroundColor(AppColors.textPrimary)
                    .lineLimit(2)
                
                if let releaseDate = movie.releaseDate {
                    // Extract just the Year (first 4 characters of YYYY-MM-DD)
                    Text(String(releaseDate.prefix(4)))
                        .font(AppFonts.courierNew(size: 14))
                        .foregroundColor(AppColors.textSecondary)
                }
                
                Spacer().frame(height: AppSpacing.xxSmall)
                
                // MARK: - Rating
                if let rating = movie.voteAverage {
                    HStack(spacing: AppSpacing.xxSmall) {
                        Image(systemName: "star.fill")
                            .foregroundColor(AppColors.secondary) // IMDb Gold from your DesignSystem!
                            .font(.system(size: AppSpacing.small))
                        
                        Text(String(format: "%.1f", rating))
                            .font(AppFonts.courierNewBold(size: 14))
                            .foregroundColor(ratingColor(for: rating))
                    }
                }
                
                Spacer().frame(height: AppSpacing.xxSmall)
                
                Text(movie.overview ?? "No overview available.")
                    .font(AppFonts.courierNew(size: 14))
                    .foregroundColor(AppColors.textOnPrimary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }
            .padding(.vertical, AppSpacing.xxSmall)
            
            Spacer(minLength: 0)
        }
        .padding(AppSpacing.cardPadding)
        .background(AppColors.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: AppSpacing.cardCornerRadius))
        .shadow(color: AppColors.backgroundElevated.opacity(0.5), radius: 8, x: 0, y: 4)
        .onTapGesture {
            onTap()
        }
    }
    
    // MARK: - Subviews & Helpers
    
    private var fallbackPoster: some View {
        Rectangle()
            .fill(AppColors.shimmer)
            .frame(width: 100, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: AppSpacing.posterCornerRadius))
            .overlay(
                Image(systemName: "film")
                    .font(.largeTitle)
                    .foregroundColor(AppColors.textMuted)
            )
    }
    
    private func ratingColor(for rating: Double) -> Color {
        if rating >= 7.0 { return AppColors.ratingHigh }
        if rating >= 5.0 { return AppColors.ratingMedium }
        return AppColors.ratingLow
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        // We use your DesignSystem's background color so it previews perfectly!
        AppColors.background.ignoresSafeArea()
        
        MoviesCardView(movie: MovieEntity(
            adult: false,
            backdropPath: nil,
            genreIds: [28, 12],
            id: 1,
            originalLanguage: "en",
            originalTitle: "Test Movie",
            overview: "This is a beautifully architected Swift application utilizing isolated packages, Protocol-Oriented dependency injection, and centralized Design Systems.",
            popularity: 100.0,
            posterPath: nil,
            releaseDate: "2026-03-22",
            title: "Clean Architecture: The Movie",
            voteAverage: 8.4,
            voteCount: 1560
        ), onTap: { print("Tapped!")})
        .padding(AppSpacing.screenHorizontal)
    }
}
