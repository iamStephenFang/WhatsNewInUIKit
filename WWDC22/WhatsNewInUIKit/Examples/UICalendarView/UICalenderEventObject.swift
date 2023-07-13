//
//  UICalenderEventObject.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

struct UICalenderEventObject {
    let decorationType: UICalendarDecorationType
    let dateComponents: DateComponents

    var titleColor: UIColor {
        isEventOver ? .lightGray : .black
    }

    private var isEventOver: Bool {
        let currentDateCompontent = Calendar(identifier: .gregorian).dateComponents([.year, .month, .day], from: .init())
        return dateComponents.isDateAfterThan(with: currentDateCompontent)
    }
}
