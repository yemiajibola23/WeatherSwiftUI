//
//  HomeHeaderView.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/13/23.
//

import SwiftUI

struct WeatherHeaderView: View {
    @State var viewModel: WeatherHeaderViewModel
    
    var location: AttributedString {
        var str1 = AttributedString(viewModel.city + ", ")
        str1.font = .body.bold()
        
        let str2 = AttributedString(viewModel.country)
        
        
        return str1 + str2
    }
    var body: some View {
        VStack {
            Text(location)
                .padding()
            
            AsyncImage(url: viewModel.icon) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 200, maxHeight: 200)
                default:
                    EmptyView()
                }
                
            }
                .frame(width: 200, height: 200)
            
            Text(viewModel.condition)
                .font(.largeTitle).bold()
                .padding(.bottom, 8)
            
            Text(viewModel.date)
                .font(.title2)
        }
        .foregroundColor(.white)
    }
}

struct WeatherHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHeaderView(viewModel: .mock)
            .background(
                Color.black
                    .opacity(0.5)
            )
    }
}
