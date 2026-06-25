//
//  SearchView.swift
//  SkyMat
//
//  Created by Antoneos Philip on 24/06/2026.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""
    var mode: String

    var router:Router
    var textColor: Color
    var weatherViewModel: WeatherViewModel
    var displayedCities: [City] {
        searchText.isEmpty ? viewModel.getCountries() : viewModel.citiesMutiable
    }

    var body: some View {
        ZStack {
            VideoBackgroundView(mode: mode)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(textColor.opacity(0.6))

                    TextField("Search city...", text: $searchText)
                        .foregroundColor(textColor)
                        .tint(textColor)

                    if !searchText.isEmpty {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(textColor.opacity(0.6))
                        }
                    }
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 12)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 12)

                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(displayedCities) { city in
                          
                            CityCard(city: city, textColor: textColor).onTapGesture {
                                weatherViewModel.lat=city.lat
                                weatherViewModel.long=city.lon
                                router.pop()
                            }
                        }
                    }
                    .padding(.top, 4)
                    .padding(.bottom, 24)
                }
            }
        }
        .onChange(of: searchText) { _, newValue in
            if !newValue.isEmpty {
                viewModel.searchCountryByName(name: newValue)
            }
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CityCard: View {
    var city: City
    var textColor: Color

    var body: some View {
        HStack(spacing: 14) {
            Text(city.img ?? "")
                .font(.system(size: 36))

            VStack(alignment: .leading, spacing: 4) {
                Text(city.name ?? "")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(textColor)

                Text("\(city.region ?? ""), \(city.country ?? "")")
                    .font(.system(size: 13))
                    .foregroundColor(textColor.opacity(0.6))
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .padding(.horizontal, 16)
    }
}
