//
//  SubLibraryView.swift
//  Cosmoclub
//
//  Created by Admin on 26/4/2568 BE.
//

import SwiftUI

struct SubLibrary3View: View {
    
    
    
    var body: some View {
        HStack{
            Text("Space Technology 🛰️")
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
                        Image("thaicom")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 320, height: 280)
                            .clipped()
                            .cornerRadius(20)

                        
                        Text("Satellites")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.black.opacity(0.8))
                        
                        Text("    Satellites are objects that move around planets or stars in space. Some satellites are natural like the Moon which travels around the Earth. Other satellites are made by humans and are called artificial satellites. Artificial satellites are launched into space to help with communication weather forecasting navigation scientific research and exploration. They send signals that allow us to use mobile phones watch television predict storms and find locations on a map. Satellites can orbit close to Earth or far away depending on their mission. Some satellites take pictures of space while others watch the oceans forests and atmosphere of Earth.")
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
                    Image("rocket")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 320, height: 280)
                        .clipped()
                        .cornerRadius(20)

                    
                    Text("Rockets")
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
    SubLibrary3View()
}
