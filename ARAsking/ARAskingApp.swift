//
//  ARAskingApp.swift
//  ARAsking
//
//  Created by Admin on 26/4/2568 BE.
//

import SwiftUI

@main
struct ARAskingApp: App {
    @AppStorage("onboarded") var onboarded = false
    var body: some Scene {
        WindowGroup {
            if onboarded {
                ARMainView() //หลังจากล็อคอินเสร็จจะไปยังหน้านั้นตลอดไป
            } else {
                OnboardView() //หลังจากล็อคแินแต่ไม่สำเร็จ
            }
        }
    }
}
