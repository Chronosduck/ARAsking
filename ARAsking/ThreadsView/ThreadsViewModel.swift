//
//  CreateSheetView.swift
//  Cosmoclub
//
//  Created by Pattanan Naosaran on 27/4/2568 BE.
//

import SwiftUI
import PhotosUI

struct ThreadsViewModel: View {
    
    @State var threadsContent: String = ""
    @State var threadsImage: PhotosPickerItem? = nil
    @State var selectedImage: UIImage? = nil
    @State var showCreateSheet: Bool = false
    @State var isShowComment = false
    
    @State var Threads: [Thread] = [Thread(content: "I'm cooked with mr kittikawin"),
                                    Thread(content: "How can i start to gain experience in Astronomy"),
                                    Thread(content: "aturn is the sixth planet from the Sun and the second largest in the Solar System, after Jupiter. It is a gas giant, with an average radius of about nine times that of Earth."),
                                    Thread(content: "Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being an ocean world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth's water is contained in its global ocean, covering 70.8% of Earth's crust. The remaining 29.2% of Earth's crust is land, most of which is located in the form of continental landmasses within Earth's land hemisphere."), ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack() {
                    HStack() {
                        Button(action: {
                            print("n")
                        }, label: {
                            Image(systemName: "person.circle.fill")
                        })
                        .font(.system(size: 50))
                        .foregroundStyle(.secondary)
                        .frame(width: 40, height: 40)
                        .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        Text("CosmoClub")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        Button(action: {
                            print("n")
                        }, label: {
                            Image(systemName: "magnifyingglass")
                        })
                        .font(.title)
                        .padding(.horizontal, 20)
                        
                    }
                    .padding(.bottom, 20)
                }
                .background(.ultraThinMaterial)
                
                
                ScrollView(.vertical) {
                    HStack(){
                        Text("Threads📡")
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .padding()
                        Spacer()
                    }
                    
                    //threads
                    ForEach(Threads) { Thread in
                        
                        HStack{
                            VStack(alignment: .leading){
                                HStack(alignment: .top){
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .padding(.leading, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Incognito man")
                                            .font(.title)
                                            .fontWeight(.semibold)
                                        Text(Thread.content)
                                        HStack{
                                            Button(action: {
                                                isShowComment = true
                                            }) {
                                                HStack{
                                                    Image(systemName: "bubble.left.and.text.bubble.right")
                                                        .resizable()
                                                        .frame(width: 45, height: 35)
                                                    Text("Comments")
                                                        //.fontWeight(.bold)
                                                }
                                            }
                                            .sheet(isPresented: $isShowComment) {
                                                Text("ADD COMMENT")
                                            }
                                            
                                            Spacer()
                                            
                                            HStack{
                                                Image(systemName: "suit.heart.fill")
                                                    .resizable()
                                                    .frame(width: 45, height: 40)
                                                    .foregroundStyle(Thread.isLike ? Color.red : Color.gray)
                                                Text("Like")
                                                    .fontWeight(.bold)
                                            }
                                            .padding(.trailing, 30)
                                            .onTapGesture {
                                                Thread.isLike = true
                                            }
                                            
                                        }
                                        .padding(.vertical, 10)
                                        
                                    }
                                }
                                .padding(.vertical, 20)
                            }
                            Spacer()
                        }
                        .border(.black)
                        .background(.gray.opacity(0.4))
                        .padding(.vertical, 10)
                        
                    }
                    
                }
                
                VStack() {
                    HStack() {
                        NavigationLink(destination:
                                        LibraryView()
                            .navigationBarHidden(true)
                        ) {
                            Image(systemName: "book.circle") //ลิงค์ไป LibraryView
                                .font(.system(size: 55))
                                .foregroundStyle(.secondary)
                                .padding(.horizontal, 30)
                        }
                        Spacer()
                        NavigationLink(destination:
                                        CreateSheetView() 
                            .navigationBarHidden(true)
                        ) {
                            Image(systemName: "arrow.right.circle") //ลิงค์ไป CreatesheetView
                                .font(.system(size: 55))
                                .foregroundStyle(.secondary)
                                .padding(.horizontal, 30)
                        }
                        NavigationLink(destination:
                                        ARMainView()
                            .navigationBarHidden(true)
                        ) {
                            Image(systemName: "arrow.right.circle") //ลิงค์ไป ARMainView
                                .font(.system(size: 55))
                                .foregroundStyle(.secondary)
                                .padding(.horizontal, 30)
                        }
                        
                    }
                    .padding(.top, 20)
                }
                .background(.ultraThinMaterial)
                
                
            }
        }
        
    }
}

#Preview {
    ThreadsViewModel()
}

//import SwiftUI
//import PhotosUI//นำเข้า photoKit
//
//struct ContentView: View {
//    @State private var selectedItem: PhotosPickerItem? = nil
//
//    @State private var selectedImage: UIImage? = nil //ภาพที่userอัพโหลด ถ้ามีีมากกว่า 1 ต้องสร้างเพิ่ม
//
//    var body: some View {
//        VStack {
//            if let image = selectedImage {
//                //กรณีมีรูป
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 300, height: 200)
//                    .clipped()
//
//                Button("Reset Picture") {
//                    selectedItem = nil
//                    selectedImage = nil
//                }
//                .buttonStyle(.bordered)
//
//            } else {
//                //กรณีไม่มีรูป
//                PhotosPicker(selection: $selectedItem, matching: .images) {
//                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to select a photo from Photo Library"))
//                    // contentUnavaiableView เป็น syntax ที่ apple ออกแบบไว้ให้
//                }
//                .buttonStyle(.plain)
//            }
//        }
//        .onChange(of: selectedItem) { _, newValue in
//            Task {
//                if let data = try? await newValue?.loadTransferable(type: Data.self),
//                   let uiImage = UIImage(data: data) {
//                    selectedImage = uiImage
//                }
//            }
//        } // onChange จะทำงานเมื่อค่าที่กำหนดเปลี่ยนแปลง(selectedItem)
//        .onAppear(perform: {
//            requestPhotoLibraryAccess()
//        }) // onAppear จะทำงานทุกครั้งเมื่อถูกเปิดหน้า
//    }
//
//    private func requestPhotoLibraryAccess() {
//        let status = PHPhotoLibrary.authorizationStatus()
//
//        switch status {
//        case .notDetermined:
//            PHPhotoLibrary.requestAuthorization { newStatus in
//                if newStatus == .authorized {
//                    print("Access granted.")
//                } else {
//                    print("Access denied.")
//                }
//            }
//        case .restricted, .denied:
//            print("Access denied or restricted.")
//        case .authorized:
//            print("Access already granted.")
//        case .limited:
//            print("Access limited.")
//        @unknown default:
//            print("Unknown authorization status.")
//        }
//    }// ฟังก์ชันขอสิทธ์เข้าถึง photoLibrary
//}
//
//#Preview {
//    ContentView()
//}


//.toolbar {
//    ToolbarItemGroup(placement: .bottomBar) {
//        Spacer()
//        Text("\(notes.count) Notes")
//            .font(.footnote)
//        Spacer()
//        Button("Create note", systemImage: "square.and.pencil") {
//            isShowCreateNote.toggle()
//        }
//
//    }
//
//    ToolbarItemGroup(placement: .topBarTrailing) {
//        Menu("Sort Menu", systemImage: "arrow.up.arrow.down") {
//            Picker("Sort picker", selection: $sort) {
//                Text("Title")
//                    .tag(SortDescriptor(\Note.title))
//                Text("Last Updated")
//                    .tag(SortDescriptor(\Note.lastUpdated, order: .reverse))
//            }
//        }
//    }
//}
