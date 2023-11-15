//
//  DailyDescriptionView.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/13/23.
//

import SwiftUI

struct DailyDescriptionView: View {
    @Binding var viewModel: DailyDescriptionViewModel
    
    var body: some View {
        HStack(spacing: 30) {
            Text(viewModel.day)
            Text(viewModel.temp)
            AsyncImage(url: viewModel.icon)
            Text(viewModel.condition)
                .font(.body.bold())
        }
        .padding(.horizontal, 20)
    }
}

struct DailyDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyDescriptionView(viewModel: .constant(.mock))
    }
}
