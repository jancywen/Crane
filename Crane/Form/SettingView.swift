//
//  SettingView.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/1.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var settings: SettingStore
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Notifications")) {
                    Toggle(isOn: $settings.isNotificationEnable) {
                        Text("Notification:")
                    }
                }
                
                Section(header: Text("Sleep tracking setting")) {
                    Toggle(isOn: $settings.isSleepTrackingEnable) {
                        Text("Sleep tracking:")
                    }
                    Picker(selection: $settings.sleepTrackingMode, label: Text("Sleep tracking mode")) {
                        ForEach(SettingStore.SleepTrackingModel.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    Stepper(value: $settings.sleepGoal, in: 6...12) {
                        Text("Sleep goal is \(settings.sleepGoal) hours")
                    }
                }
                
                
                Section {
                    if !settings.isPro {
                        Button(action:{
                            self.settings.unlockPro()
                        }){
                            Text("Unlock PRO")
                        }
                    } else {
                        Button(action: {
                            self.settings.restorePurchase()
                        }) {
                            Text("Restore purchase")
                        }
                    }
                }
            }.navigationBarTitle(Text("Settings"))
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
