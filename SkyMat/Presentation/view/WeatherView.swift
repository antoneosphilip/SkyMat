//
//  WeatherView.swift
//  SkyMate
//
//  Created by Antoneos Philip on 22/06/2026.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Weather View")
                .font(.system(size: 28))
                .fontWeight(.bold)
            
            Text("31°")
                .font(.system(size: 72))
                .fontWeight(.bold)
            
            Text("Sunny")
                .font(.system(size: 16))
                .fontWeight(.bold)
            Text("H: 35°  L: 25°")
                .font(.system(size: 15))
                .fontWeight(.bold)
            
            WeatherCardSection().padding(.horizontal, 16)
            
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                DetailCell()
                DetailCell()
                DetailCell()
                DetailCell()
                
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct WeatherCardSection:View {
        var body: some View {
            VStack(alignment: .leading,spacing: 8){
                Text("3-DAY FORECAST")
                    .font(.system(size: 11, weight: .bold))
                
                DayForecastRow()
                
                DayForecastRow()
                
            }
            .padding() .background(.ultraThinMaterial)
            .opacity(0.7).cornerRadius(24)
        }
    }
    
    struct DayForecastRow: View {
        
        var body:some View{
            HStack{
                Text("Monday")
                    .font(.system(size: 15,weight: .bold))
                
                Spacer()
                AsyncImage(url: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/113.png"))
                    .frame(width: 28, height: 28)
                Text("25°")
                
            }.padding()
        }
    }
    struct DetailCell:View {
        var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                Text("Humidity")
                    .font(.system(size: 11, weight: .bold))
                HStack( spacing: 3) {
                    Text("60")
                        .font(.system(size: 26, weight: .bold))
                    Text("%")
                        .font(.system(size: 13, weight: .bold))
                }
                
               }   .frame(maxWidth: .infinity, alignment: .leading) .padding(20).background(.ultraThinMaterial).cornerRadius(14)
                .opacity(0.7).padding(.leading, 10)
        }
    }
}
