//
//  SubLibraryView.swift
//  Cosmoclub
//
//  Created by Admin on 26/4/2568 BE.
//

import SwiftUI

struct SubLibrary2View: View {
    
    
    
    var body: some View {
        HStack{
            Text("Constellations 🌌")
                .font(.largeTitle)
                .fontWeight(.bold)
            
        }
        .padding(.bottom, 20)
        ScrollView {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 600)
                        .cornerRadius(20)
                        .foregroundStyle(Color.gray.opacity(0.3))
                        .padding(.top, 50)
                    
                    VStack{
                        Image("zodiac")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 320, height: 280)
                            .clipped()
                            .cornerRadius(20)

                        
                        Text("Zodiac Constellations")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.black.opacity(0.8))
                        
                        Text("    Zodiac constellations are special groups of stars that form patterns in the night sky. These constellations are important because they lie along the path that the Sun appears to travel across the sky over the course of a year. This path is called the ecliptic and it passes through twelve main constellations.The twelve zodiac constellations are Aries Taurus Gemini Cancer Leo Virgo Libra Scorpio Sagittarius Capricorn Aquarius and Pisces. Each constellation is linked to certain dates of the year and people often associate their birth dates with a zodiac sign. Many cultures have used zodiac signs for storytelling calendars and astrology.")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(.black.opacity(0.8))
                            .frame(width: 300, height: 180)
                        Button(action: {}) {
                            Text("                                                  Read more...")
                                .fontWeight(.bold)
                                .foregroundStyle(Color.blue)
                        }
                    }
                    .padding(.top, 40)
                }
            
            ZStack {
                Rectangle()
                    .frame(width: 350, height: 600)
                    .cornerRadius(20)
                    .foregroundStyle(Color.gray.opacity(0.3))
                    .padding(.top, 50)
                
                VStack{
                    Image("leo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 320, height: 280)
                        .clipped()
                        .cornerRadius(20)

                    
                    Text("Leo")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.black.opacity(0.8))
                    
                    Text("    Rockets are vehicles that travel through space by expelling gas from their engines. They work based on the principle of action and reaction which means that pushing gas out of the engine causes the rocket to move forward. ")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundColor(.black.opacity(0.8))
                        .frame(width: 300, height: 180)
                    Button(action: {}) {
                        Text("                                                  Read more...")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.blue)
                    }
                }
                .padding(.top, 40)
            }
            }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SubLibrary2View()
}
