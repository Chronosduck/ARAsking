//
//  SubLibraryView.swift
//  Cosmoclub
//
//  Created by Admin on 26/4/2568 BE.
//

import SwiftUI

struct SubLibraryView: View {
    
    @State private var showQuiz1: Bool = false
    @State private var showQuiz2: Bool = false

    
    var body: some View {
        HStack{
            Text("Solar System ⭐️")
                .font(.largeTitle)
                .fontWeight(.bold)
            
        }
        .padding(.bottom, 20)
        ScrollView {
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 620)
                        .cornerRadius(20)
                        .foregroundStyle(Color.gray.opacity(0.3))
                        .padding(.top, 50)
                    
                    VStack{
                        Image("sun")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 320, height: 280)
                            .clipped()
                            .cornerRadius(20)

                        
                        Text("The Sun")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.black.opacity(0.8))
                        
                        Text("    The Sun is a giant ball of hot glowing gases at the center of our solar system. It gives off light and heat that make life possible on Earth. Without the Sun there would be no plants no animals and no people because all living things depend on its energy.]The Sun is mostly made of hydrogen and helium. Deep inside the Sun hydrogen atoms are pressed together and turn into helium through a process called nuclear fusion. This process releases a huge amount of energy that travels outward and reaches us as sunlight.")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(.black.opacity(0.8))
                            .frame(width: 300, height: 180)
                        HStack{
                            Button(action: {
                                    showQuiz1.toggle()
                                }) {
                                    Image(systemName: "graduationcap")
                                        .font(.title2)
                                        .foregroundColor(.purple)
                                }
                                .sheet(isPresented: $showQuiz1) {
                                    QuizView1()
                                        .presentationBackground(.ultraThinMaterial)
                                        .presentationDetents([ .large])
                                }
                                .ignoresSafeArea()
                            
                            Spacer()
                                .frame(width: 150)
                            Button(action: {}) {
                                Text("Read more...")
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.blue)
                            }
                            
                        }
                        .padding(.top)
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
                    Image("earth")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 320, height: 280)
                        .clipped()
                        .cornerRadius(20)

                    
                    Text("The Earth")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.black.opacity(0.8))
                    
                    Text("    The Earth is the third planet from the Sun and it is the only known planet that supports life. It has a perfect balance of air water and temperature that allows plants animals and humans to survive. The Earth is about four point five billion years old and it has gone through many changes over time.The Earth is made up of three main layers called the crust the mantle and the core. The crust is the outermost layer where we live while the core is deep inside and is made mostly of metal. Earthquakes mountains and volcanoes happen because of movements in these layers. ")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .foregroundColor(.black.opacity(0.8))
                        .frame(width: 300, height: 180)
                    HStack{
                        Button(action: {
                                showQuiz2.toggle()
                            }) {
                                Image(systemName: "graduationcap")
                                    .font(.title2)
                                    .foregroundColor(.purple)
                            }
                            .sheet(isPresented: $showQuiz2) {
                                QuizView2()
                                    .presentationBackground(.ultraThinMaterial)
                                    .presentationDetents([ .large])
                            }
                            .ignoresSafeArea()
                        
                        Spacer()
                            .frame(width: 150)
                        Button(action: {}) {
                            Text("Read more...")
                                .fontWeight(.bold)
                                .foregroundStyle(Color.blue)
                        }
                        
                    }
                    .padding(.top)
                }
                .padding(.top, 40)
                
                
            }
            }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SubLibraryView()
}
