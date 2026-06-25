//
//  Saved Location.swift
//  SkyMat
//
//  Created by Antoneos Philip on 25/06/2026.
//

import Foundation
import SwiftUI
import SwiftData

struct SavedLocationsView: View {
    @Environment(\.modelContext) private var cxt
    @Query private var savedCities: [CityEntity]
    var weatherViewModel: WeatherViewModel
    var router: Router

    var textColor: Color {
        weatherViewModel.isDay ? .black : .white
    }

    var body: some View {
        ZStack {
            VideoBackgroundView(mode: weatherViewModel.isDay ? "morninig" : "night")
                .id(weatherViewModel.isDay)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                if savedCities.isEmpty {
                    Spacer()
                    VStack(spacing: 12) {
                        Image(systemName: "bookmark.slash")
                            .font(.system(size: 48, weight: .thin))
                            .foregroundColor(textColor.opacity(0.4))
                        Text("No saved locations")
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(textColor.opacity(0.6))
                    }
                    Spacer()
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 12) {
                            ForEach(savedCities) { city in
                                SavedCityCard(city: city, textColor: textColor)
                                    .onTapGesture {
                                        weatherViewModel.lat = city.lat
                                        weatherViewModel.long = city.lon
                                        router.pop()
                                    }
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            cxt.delete(city)
                                            try? cxt.save()
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                        }
                        .padding(.top, 8)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                    }
                }
            }
        }
        .navigationTitle("Saved Locations")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SavedCityCard: View {
    var city: CityEntity
    var textColor: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 36))
                .foregroundColor(textColor.opacity(0.7))

            VStack(alignment: .leading, spacing: 4) {
                Text(city.name ?? "")
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .foregroundColor(textColor)

                Text("\(city.region ?? ""), \(city.country ?? "")")
                    .font(.system(size: 13, design: .rounded))
                    .foregroundColor(textColor.opacity(0.6))
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(textColor.opacity(0.4))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}
