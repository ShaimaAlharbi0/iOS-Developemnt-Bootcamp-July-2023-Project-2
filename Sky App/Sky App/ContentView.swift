//
//  ContentView.swift
//  Sky App
//
//  Created by Shaima Alharbi on 04/02/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city: String = ""
    
    var body: some View {
        ZStack{
            Image("gg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 500, height:900)
               

            
            VStack{
                Text("Weather💦")
                    .font(.title)
                    .fontWeight(.bold)
                    .navigationTitle("Weather")
                    .foregroundColor(.white)
                    .padding(150)
//                Image("mm")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 200, height:60)
                Spacer()

            }
            VStack {
                TextField("Enter city", text: $city)
                    .padding()
                    .foregroundColor(.blue)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(70)
                    .padding(50)
                Button("Get Weather") {
                    viewModel.fetchWeatherData(for: city)
                       
                }
                .padding(20)

                if let weatherData = viewModel.weatherData {
                    Text("Temperature: \(weatherData.main.temp)°C")
                        .foregroundColor(.white)

                    Text("Humidity: \(weatherData.main.humidity)%")
                        .foregroundColor(.white)

                    Text("Description:\(weatherData.weather[0].description)")
                        .foregroundColor(.white)
                }
                
                if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
//                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(1)
                        .padding(60)


                }
                
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
