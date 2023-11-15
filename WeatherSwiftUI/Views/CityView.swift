//
//  CityView.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/13/23.
//

import SwiftUI

struct CityView: View {
    @StateObject var cityViewModel: CityViewModel
    @State var location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                WeatherHeaderView(viewModel: cityViewModel.weatherHeaderViewModel)
                    .padding()
                
                ScrollView {
                    HStack(spacing: 20) {
                        ForEach($cityViewModel.hourlyViewModels) { viewModel in
                            HourlyWeatherView(viewModel: viewModel)
                        }
                    }
//                    .frame(maxWidth: .infinity )
                }
                .padding(.horizontal, 50)
                
                Text("This Week")
                    .font(.title)
                    .padding()
                VStack(alignment: .leading, spacing: 10) {
                    ForEach($cityViewModel.dailyViewModels) {
                        DailyDescriptionView(viewModel: $0)
                    }
                }
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.teal)
                )
            }
            .foregroundColor(.white)
//            .frame(maxWidth: .infinity)
            .task {
                await cityViewModel.fetchWeather()
        }
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(cityViewModel: .mock, location: .mock.first!)
            .background(
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
            )
            
    }
}
