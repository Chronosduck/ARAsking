//
//  NewLibNavBar.swift
//  Updated
//
//  Created by Pattanan Naosaran on 28/4/2568 BE.
//

import SwiftUI

struct NewLibNavBar: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 50))
                        .padding(.leading, 20)
                }
                Spacer()

                Text("Library")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.trailing, 50)
                    
                Spacer()
                    
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    NewLibNavBar()
}
