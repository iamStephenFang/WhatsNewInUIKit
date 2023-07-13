//
//  UICalendarViewExample.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 9.06.2022.
//

import UIKit

final class UICalendarViewExample: UIViewController {

    private var eventDays: [UICalenderEventObject] = [
        .init(decorationType: .customView(title: "WWDC"), dateComponents: .init(year: 2022, month: 6, day: 6)),
        .init(decorationType: .customView(title: "WWDC"), dateComponents: .init(year: 2022, month: 6, day: 7)),
        .init(decorationType: .customView(title: "WWDC"), dateComponents: .init(year: 2022, month: 6, day: 8)),
        .init(decorationType: .customView(title: "WWDC"), dateComponents: .init(year: 2022, month: 6, day: 9)),
        .init(decorationType: .customView(title: "WWDC"), dateComponents: .init(year: 2022, month: 6, day: 10))
    ]

    private var selectedDates: [DateComponents] = []

    private lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.timeZone = .autoupdatingCurrent
        calendarView.locale = .current
        calendarView.backgroundColor = .white
        calendarView.tintColor = .orange
        calendarView.fontDesign = .default
        calendarView.selectionBehavior?.updateSelectableDates()
        calendarView.layer.cornerRadius = 8
        calendarView.layer.masksToBounds = true
        calendarView.delegate = self
        calendarView.visibleDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2022, month: 6, day: 1)

        // Set singleDateSelection if you want to set for Single Selection
        calendarView.selectionBehavior = multiDateSelection
        return calendarView
    }()

    private lazy var multiDateSelection: UICalendarSelectionMultiDate = {
        let multiDateSelection = UICalendarSelectionMultiDate(delegate: self)
        return multiDateSelection
    }()

    private lazy var singleDateSelection: UICalendarSelectionSingleDate = {
        let singleDateSelection = UICalendarSelectionSingleDate(delegate: self)
        return singleDateSelection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        view.addSubview(calendarView)
        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension UICalendarViewExample: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        guard let dateComponents else {
            return
        }
        selectedDates = [dateComponents]
    }

    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        guard let dateComponents else {
            return false
        }
        return dateComponents.isDatePassed()
    }
}

extension UICalendarViewExample: UICalendarSelectionMultiDateDelegate {
    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        selectedDates.removeAll(where: { dateComponents == $0 })
    }

    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        selectedDates.append(dateComponents)
    }

    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
        dateComponents.isDatePassed()
    }

    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canDeselectDate dateComponents: DateComponents) -> Bool {
        dateComponents.isDatePassed()
    }
}

extension UICalendarViewExample: UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        guard let event = eventDays.filter({ $0.dateComponents.isSameDate(with: dateComponents) }).first else {
            return nil
        }

        switch event.decorationType {
        case .none:
            return nil
        case .defaultDecorator:
            return .default(color: .purple, size: .large)
        case .image:
            return .image(.init(systemName: "applelogo"), color: .red)
        case .customView:
            return .customView {
                let label = UILabel()
                label.text = "WWDC"
                label.textColor = event.titleColor
                label.font = .boldSystemFont(ofSize: 10)
                return label
            }
        }
    }
}
