//
//  HourlyWeatherView.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/14/23.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct HourlyWeatherView: View {
    @Binding var viewModel: HourlyWeatherViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.time)
            WebImage(url: viewModel.icon)
                .resizable()
                .frame(width: 50, height: 50)
            Text(viewModel.temperature)
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(viewModel: .constant(.mock))
            .frame(width: 100, height: 100)
    }
}
