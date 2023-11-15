//
//  HomeView.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/10/23.
//

import SwiftUI

struct Week7DayView: View {
    @StateObject var viewModel: Week7DayViewModel
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
            TabView {
                ForEach(viewModel.locations) { location in
                    CityView(cityViewModel: CityViewModel(lat: locationManager.location?.latitude ?? 10.99, lon: locationManager.location?.longitude ?? 44.34), location: location)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Week7DayView(viewModel: Week7DayViewModel(locations: Location.mock))
    }
}
