//
//  HourlyWeatherView.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/14/23.
//

import SwiftUI

struct HourlyWeatherView: View {
    @Binding var viewModel: HourlyWeatherViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.time)
            AsyncImage(url: viewModel.icon)
                .frame(idealWidth: 20, idealHeight: 20)
            Text(viewModel.temperature)
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(viewModel: .constant(.mock))
    }
}
