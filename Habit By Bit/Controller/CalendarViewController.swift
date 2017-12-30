//
//  CalendarViewController.swift
//  Habit By Bit
//
//  Created by Grant Kim on 12/30/17.
//  Copyright © 2017 2.5 Yellow. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    let nonMonthDateColor = UIColor.gray
    let defaultDateColor = UIColor.black
    let selectedDateColor = UIColor.red
    
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCalendarView()
    }
    
    func setupCalendarView() {
        // set up spacing of the calendar cells
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        // set up year and month labels
        calendarView.visibleDates() { visibleDates in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CalendarCell else {return}
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedDateColor
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = defaultDateColor
            } else {
                validCell.dateLabel.textColor = nonMonthDateColor
            }
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        formatter.dateFormat = "yyyy"
        yearLabel.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMMM"
        monthLabel.text = formatter.string(from: date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CalendarViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}

extension CalendarViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CalendarCell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        
        // guards against problems relating to the reuse of cells
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    // function for when a cell is selected
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    // changes month and year labels when scrolling
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
}
