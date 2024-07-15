//
//  ContentView.swift
//  pedalpro
//
//  Created by Leandro Hernandez on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Top Bar
            HStack {
                HStack(spacing: 0) {
                    Text("Pedal")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(hex: "1d1d1b"))
                    Text("Pro")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(hex: "557ff6"))
                }
                .padding(.leading)

                Spacer()

                HStack(spacing: 20) {
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "bell")
                }
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(.trailing)
            }
            .padding(.top, 50)
            .padding(.bottom, 10)
            .background(Color.white)

            // Scrollable content
            ScrollView {
                VStack(spacing: 20) {
                    // Main Section
                    ZStack {
                        Image("bicycle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 300)

                        // Labels
                        VStack(alignment: .leading, spacing: 10) {
                            LabelView(text: "Mountain Bike, Fat Tire...", offsetX: -40, offsetY: -80)
                            LabelView(text: "High Grip Handle", offsetX: 80, offsetY: -40)
                            LabelView(text: "Dual Disk Brake", offsetX: -80, offsetY: -30)
                            LabelView(text: "Fat Tire", offsetX: -80, offsetY: 30)
                        }

                        // Price Tag
                        Text("$199.00")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.red)
                            .cornerRadius(24)
                            .offset(x: 120, y: -120)
                            .shadow(radius: 8)
                    }
                    .padding()

                    // Best For You Section
                    VStack {
                        HStack {
                            Text("Best For You")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.leading)

                            Spacer()

                            Button(action: {}) {
                                Text("View All")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing)
                        }

                        ProductCard(name: "Full Suspension Bicycle", price: "$599.00", imagePosition: .left)
                        ProductCard(name: "New Mountain bicycle", price: "$699.00", imagePosition: .right)
                    }
                    .padding()
                }
            }
        }
        .background(Color(UIColor.white))
    }
}

struct LabelView: View {
    let text: String
    let offsetX: CGFloat
    let offsetY: CGFloat

    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .padding(5)
            .background(Color.white.opacity(0.7))
            .cornerRadius(5)
            .offset(x: offsetX, y: offsetY)
            .shadow(radius: 2)
    }
}

enum ImagePosition {
    case left, right
}

struct ProductCard: View {
    let name: String
    let price: String
    let imagePosition: ImagePosition

    var body: some View {
        HStack {
            if imagePosition == .left {
                Image("b2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 80)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.body)
                    .foregroundColor(.black)
                
                HStack {
                    Text(price)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .frame(width: 24, height: 24)
                            .background(Color(hex: "040404"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }

            Spacer()

            if imagePosition == .right {
                Image("b2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 80)
            }
        }
        .padding()
        .background(Color(hex: "f7f7f7"))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xff0000) >> 16) / 0xff
        let green = Double((rgbValue & 0xff00) >> 8) / 0xff
        let blue = Double(rgbValue & 0xff) / 0xff

        self.init(red: red, green: green, blue: blue)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
