//
//  LibraryIView.swift
//  Cosmoclub
//
//  Created by Admin on 26/4/2568 BE.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        
        //        VStack {
        //            HStack{
        //                Button {
        //
        //                } label: {
        //                    Image(systemName: "chevron.left")
        //                        .font(.system(size: 50))
        //                        .padding(.leading, 20)
        //                }
        //                Spacer()
        //
        //                Text("Library")
        //                    .font(.largeTitle)
        //                    .fontWeight(.bold)
        //                    .padding(.trailing, 50)
        //
        //                Spacer()
        //
        //            }
        //            .padding(.bottom, 20)
        //        }
        //        .background(.ultraThinMaterial)
        NavigationView {
            ScrollView {
                VStack {
                    HStack{
                        Text("Library")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading,40)
                        Spacer()
                    }
                    NavigationLink(destination: SubLibraryView()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 350)
                                .cornerRadius(20)
                                .foregroundStyle(Color.gray.opacity(0.3))
                            
                            VStack{
                                Image("LibraryView1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 280, height: 280)
                                    .clipped()
                                    .cornerRadius(20)
                                
                                Text("Solar system ⭐️")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                    
                    
                    NavigationLink(destination: SubLibrary2View()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 350)
                                .cornerRadius(20)
                                .foregroundStyle(Color.gray.opacity(0.3))
                                .shadow(radius: 10)
                            
                            VStack{
                                Image("LibraryView2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 280, height: 280)
                                    .clipped()
                                    .cornerRadius(20)
                                
                                Text("Constellations 🌌")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                
                                
                            }
                        }
                    }.padding(30)
                    
                    NavigationLink(destination: SubLibrary3View()) {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 350)
                                .cornerRadius(20)
                                .foregroundStyle(Color.gray.opacity(0.3))
                                .shadow(radius: 10)
                            
                            VStack{
                                Image("sat")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 280, height: 280)
                                    .clipped()
                                    .cornerRadius(20)
                                
                                Text("Space Technology 🛰️")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .foregroundColor(.black)
                                
                                
                                
                            }
                        }
                        
                        
                        
                    }
                    
                    Spacer()
                    
                }
                
                
            }
//            .frame(width: .infinity, height: 1500, alignment: .center)
            
            
            
            //                ZStack {
            //                    Button(action: {
            //
            //                    }) {
            //                        Rectangle()
            //                            .frame(width: 350, height: 350)
            //                            .foregroundStyle(Color.gray.opacity(0.3))
            //                            .cornerRadius(20)
            //                            .shadow(radius: 10)
            //                    }
            //
            //                }
            
        }
        
    }
}


#Preview {
    LibraryView()
}
