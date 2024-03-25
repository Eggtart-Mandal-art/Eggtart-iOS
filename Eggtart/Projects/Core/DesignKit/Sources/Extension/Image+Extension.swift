//
//  Image+Extension.swift
//  DesignKit
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import Foundation
import SwiftUI

public extension Image {
    
    // MARK: - Main
    static var gridonRounded: Image {
        Image("GridonRounded", bundle: Bundle.module)
    }
    
    static var calendarTodayRounded: Image {
        Image("CalendarTodayRounded", bundle: Bundle.module)
    }
    
    static var settingsRounded: Image {
        Image("SettingsRounded", bundle: Bundle.module)
    }
    
    static var timerRounded: Image {
        Image("TimerRounded", bundle: Bundle.module)
    }
}
