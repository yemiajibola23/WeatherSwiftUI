//
//  PlaceholderView.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/12/23.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "sun.max.fill")
                    .font(.largeTitle)
                Text("24°")
                    .font(.largeTitle)
            }
            Text("Sunny outside.\nDon't forget your hat!")
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
