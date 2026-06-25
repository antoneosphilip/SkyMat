//
//  WeatherDetails.swift
//  SkyMat
//
//  Created by Antoneos Philip on 23/06/2026.
//

import Foundation
import SwiftUI
struct WeatherDetails: View {
    var forestDay: Forecastday
    var textColor: Color
    var videoMode: String
    var body: some View {
        ZStack {

            VideoBackgroundView(
                mode:videoMode
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            ScrollView {
                LazyVStack {
                    ForEach(forestDay.hour) { hour in
                        ForecastItem(hour: hour, textColor: textColor)
                    }
                }
            }
        }
        .navigationTitle(Utils.getNameByDate(date: forestDay.date))
    }

    struct ForecastItem :View{
        var hour: Hour
        var textColor:Color
        var body: some View{
            HStack(spacing:16){
                Text(Utils.formatHour(time: hour.time))
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(textColor)
                    .frame(width: 60, alignment: .leading)
                
                AsyncImage(url: URL(string: "https:\(hour.condition?.icon ?? "")")) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 40)
                Text(hour.condition?.text ?? "")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(textColor.opacity(0.8))
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(width: 40)
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(String(format: "%.0f°", hour.temp_c ?? 0))
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(textColor)
                    
                    Text("Feels \(String(format: "%.0f°", hour.feelslike_c ?? 0))")
                        .font(.system(size: 20))
                        .foregroundColor(textColor.opacity(0.7))
                }
            }.padding().background(.ultraThinMaterial).cornerRadius(12).padding(.horizontal, 16).padding(.vertical, 5)
        }
    }
}
