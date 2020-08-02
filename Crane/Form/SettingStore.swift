//
//  SettingStore.swift
//  Crane
//
//  Created by wangwenjie on 2020/8/1.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI
import Combine

final class SettingStore: ObservableObject {
    private enum Keys {
        static let pro = "pro"
        static let sleepGoal = "sleep_goal"
        static let notificationEnable = "notifications_enabled"
        static let sleepTrackingEnable = "sleep_tracking_enabled"
        static let sleepTrackingMode = "sleep_tracking_mode"
    }
    
    private let cancellable: Cancellable
    private let defaults: UserDefaults
    
    let objectWillChange = PassthroughSubject<Void, Never> ()
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            Keys.sleepGoal:8,
            Keys.sleepTrackingEnable: true,
            Keys.sleepTrackingMode: SleepTrackingModel.moderate.rawValue
        ])
        
        cancellable = NotificationCenter.default
            .publisher(for: UserDefaults.didChangeNotification)
            .map{_ in ()}.subscribe(objectWillChange)
    }
    
    var isNotificationEnable: Bool {
        set{ defaults.set(newValue, forKey: Keys.notificationEnable)}
        get {defaults.bool(forKey: Keys.notificationEnable)}
    }
    
    var isPro: Bool {
        set {defaults.set(newValue, forKey: Keys.pro)}
        get {defaults.bool(forKey: Keys.pro)}
    }
    
    var isSleepTrackingEnable: Bool {
        set {defaults.set(newValue, forKey: Keys.sleepTrackingEnable)}
        get {defaults.bool(forKey: Keys.sleepTrackingEnable)}
    }
    
    var sleepGoal: Int {
        set {defaults.set(newValue, forKey: Keys.sleepGoal)}
        get {defaults.integer(forKey: Keys.sleepGoal)}
    }
    
    
    enum SleepTrackingModel: String, CaseIterable {
        case low
        case moderate
        case aggressive
    }
    
    var sleepTrackingMode: SleepTrackingModel {
        get {
            return defaults.string(forKey: Keys.sleepTrackingMode).flatMap({SleepTrackingModel(rawValue: $0)}) ?? .moderate
        }
        set {
            defaults.set(newValue.rawValue, forKey: Keys.sleepTrackingMode)
        }
    }
}

extension SettingStore {
    func unlockPro()  {
        isPro = true
    }
    func restorePurchase() {
        isPro = false
    }
}
