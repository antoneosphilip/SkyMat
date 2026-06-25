//
//  WeatherView.swift
//  SkyMate
//
//  Created by Antoneos Philip on 22/06/2026.
//
import SwiftUI

struct WeatherView: View {
    
    @StateObject var weatherViewModel: WeatherViewModel
    var router: Router
    
     @state var textColor: Color {
        weatherViewModel.isMorning() ? .black : .white
    }
    
    var body: some View {
        ZStack {
            VideoBackgroundView(
                mode: weatherViewModel.isMorning() ? "morninig" : "night"
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack(spacing: 6) {
                        Text(weatherViewModel.locationMutable?.name ?? "")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))
                            .foregroundColor(textColor)
                        
                        HStack(alignment: .top, spacing: 0) {
                            Text("\(Int(weatherViewModel.currentMutable?.temp_c ?? 0))")
                                .font(.system(size: 70, weight: .thin, design: .rounded))
                                .foregroundColor(textColor)
                            
                            Text("°")
                                .font(.system(size: 28, weight: .thin, design: .rounded))
                                .foregroundColor(textColor)
                                .padding(.top, 10)
                        }
                        
                        Text(weatherViewModel.currentMutable?.condition?.text ?? "")
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(textColor.opacity(0.85))
                        
                        Text("H:\(Int(weatherViewModel.forecastMutable?.forecastday[0].day?.maxtemp_c ?? 0))°  L:\(Int(weatherViewModel.forecastMutable?.forecastday[0].day?.mintemp_c ?? 0))°")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(textColor.opacity(0.75))
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .padding(.top, 60)
                    .padding(.bottom, 36)
                    
                    WeatherCardSection(
                        forecastday: weatherViewModel.forecastMutable?.forecastday ?? [],
                        textColor: textColor,
                        router: router
                    )
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    
                    LazyVGrid(
                        columns: [GridItem(.flexible()), GridItem(.flexible())],
                        spacing: 12
                    ) {
                        DetailCell(label: "VISIBILITY", value: "\(weatherViewModel.currentMutable?.vis_km ?? 0)", unit: "km", textColor: textColor)
                        DetailCell(label: "HUMIDITY", value: "\(weatherViewModel.currentMutable?.humidity ?? 0)", unit: "%", textColor: textColor)
                        DetailCell(label: "FEELS LIKE", value: "\(Int(weatherViewModel.currentMutable?.feelslike_c ?? 0))", unit: "°", textColor: textColor)
                        DetailCell(label: "PRESSURE", value: "\(Int(weatherViewModel.currentMutable?.pressure_mb ?? 0))", unit: "hPa", textColor: textColor)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 40)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        router.navigate(to: .search)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(textColor)
                    }
                }
            }.onChange(of: weatherViewModel.lat) { _, _ in
                weatherViewModel.fetchWeatherLatLon()
            }
        }
    }
   
    struct WeatherCardSection: View {
        var forecastday: [Forecastday]
        var textColor: Color
        var router: Router

        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("3-DAY FORECAST")
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundColor(textColor.opacity(0.6))
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .padding(.bottom, 10)
                
                ForEach(Array(forecastday.enumerated()), id: \.element.date) { index, day in
                    if index > 0 {
                        Divider()
                            .background(textColor.opacity(0.15))
                            .padding(.horizontal, 16)
                    }
                    DayForecastRow(day: day, textColor: textColor)
                        .onTapGesture {
                            router.navigate(to: .details(index: index))
                        }
                }
            }
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
    }
    
    struct DayForecastRow: View {
        var day: Forecastday
        var textColor: Color
        
        var body: some View {
            HStack(spacing: 0) {
                Text(Utils.getNameByDate(date: day.date ?? ""))
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(textColor)
                    .frame(width: 100, alignment: .leading)
                
                Spacer()
                
                AsyncImage(url: URL(string: "https:\(day.day?.condition?.icon ?? "")")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.clear
                }
                .frame(width: 30, height: 30)
                
                Spacer()
                
                HStack(spacing: 6) {
                    Text("\(Int(day.day?.mintemp_c ?? 0))°")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(textColor.opacity(0.55))
                        .frame(width: 36, alignment: .trailing)
                    
                    Text("—")
                        .foregroundColor(textColor.opacity(0.35))
                    
                    Text("\(Int(day.day?.maxtemp_c ?? 0))°")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(textColor)
                        .frame(width: 36, alignment: .leading)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
        }
    }
    
    struct DetailCell: View {
        var label: String
        var value: String
        var unit: String
        var textColor: Color
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(label)
                    .font(.system(size: 11, weight: .semibold, design: .rounded))
                    .foregroundColor(textColor.opacity(0.6))
                
                HStack(alignment: .lastTextBaseline, spacing: 2) {
                    Text(value)
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .foregroundColor(textColor)
                    
                    Text(unit)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(textColor.opacity(0.6))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(18)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
    }
}
