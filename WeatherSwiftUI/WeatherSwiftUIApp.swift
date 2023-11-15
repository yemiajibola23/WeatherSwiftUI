//
//  WeatherSwiftUIApp.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/10/23.
//

import SwiftUI

@main
struct WeatherSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            Week7DayView(viewModel: Week7DayViewModel(locations: Location.mock))
                .environmentObject(LocationManager())
        }
    }
}
