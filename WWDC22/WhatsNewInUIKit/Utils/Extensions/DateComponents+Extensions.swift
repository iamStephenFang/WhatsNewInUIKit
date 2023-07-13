//
//  DateComponents+Extensions.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import Foundation

extension DateComponents {
    func isDateAfterThan(with dateComponents: DateComponents) -> Bool {
        guard self.year ?? .zero >= dateComponents.year ?? .zero,
           self.month ?? .zero >= dateComponents.month ?? .zero,
           self.day ?? .zero >= dateComponents.day ?? .zero else {
            return true
        }
        return false
    }

    func isDatePassed() -> Bool {
        let currentDateCompontent = Calendar(identifier: .gregorian).dateComponents([.year, .month, .day], from: .init())
        if currentDateCompontent.year ?? .zero > self.year ?? .zero { return false }
        if currentDateCompontent.month ?? .zero > self.month ?? .zero { return false }
        if currentDateCompontent.day ?? .zero > self.day ?? .zero { return false }
        return true
    }

    func isSameDate(with dateComponents: DateComponents) -> Bool {
        if self.year ?? .zero == dateComponents.year ?? .zero,
           self.month ?? .zero == dateComponents.month ?? .zero,
           self.day ?? .zero == dateComponents.day ?? .zero {
            return true
        }
        return false
    }
}
