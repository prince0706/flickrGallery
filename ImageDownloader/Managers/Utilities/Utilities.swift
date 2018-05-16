//
//  Utilities.swift
//
//  Created by Arvind Singh on 13/06/17.
//  Copyright © 2017 Appster. All rights reserved.
//

import Foundation
import UIKit
// class Utilities {

// ------------------------------------------- Alerts -------------------------------------------
let kTryAgainMessage = "Something went wrong, please try again."

/**
 Global function to check if the input object is initialized or not.

 - parameter value: value to verify for initialization

 - returns: true if initialized
 */
func isObjectInitialized(_ value: Any?) -> Bool {
    guard let _ = value else {
        return false
    }
    return true
}

func showTryAgainAlert() {

    showBanner(message: kTryAgainMessage)
}

// MARK: Thead Queues -------------------------------------
func dispatchMainQueue(_ block: @escaping () -> Void) {
    DispatchQueue.main.async { () -> Void in
        block()
    }
}

struct Device {
    // iDevice detection code
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_RETINA = UIScreen.main.scale >= 2.0

    static let SCREEN_WIDTH = Int(UIScreen.main.bounds.size.width)
    static let SCREEN_HEIGHT = Int(UIScreen.main.bounds.size.height)
    static let SCREEN_MAX_LENGTH = Int(max(SCREEN_WIDTH, SCREEN_HEIGHT))
    static let SCREEN_MIN_LENGTH = Int(min(SCREEN_WIDTH, SCREEN_HEIGHT))

    static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH < 568
    static let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568
    static let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667
    static let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736
    static let IS_IPHONE_X = IS_IPHONE && SCREEN_MAX_LENGTH == 812
}

func heightForView(text: String, width: CGFloat) -> CGFloat {
    let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = UIFont(name: "Avenir-Medium", size: 15)
    label.text = text
    label.sizeToFit()
    print(label.frame.height)
    return label.frame.height
}

func showBannerInBottom(with title: String, buttonTitle: String = "") -> BaseNotificationBanner {
    let banner = NotificationBanner(customView: BannerView(title: title, buttonTitle: buttonTitle))

    banner.customBannerHeight = heightForView(text: title, width: (buttonTitle.trimmed().length != 0) ? (UIScreen.main.bounds.width - 90) + 30 : (UIScreen.main.bounds.width - 90)) + 30
    banner.dismissOnTap = (buttonTitle.length > 0) ? false : true
    banner.autoDismiss = (buttonTitle.length > 0) ? false : true
    banner.show(queuePosition: .front, bannerPosition: .top)
    return banner
}

func showBannerOnTop(with title: String, buttonTitle: String = "") -> BaseNotificationBanner {
    let banner = NotificationBanner(customView: BannerView(title: title, buttonTitle: buttonTitle))
    banner.dismissOnTap = (buttonTitle.length > 0) ? false : true
    banner.autoDismiss = (buttonTitle.length > 0) ? false : true
    banner.show(queuePosition: .front, bannerPosition: .top)
    return banner
}

func setNavBarBackButtonText(button: UIButton) {
    let attributedString = NSMutableAttributedString(string: NSLocalizedString("BACK_TEXT", comment: ""), attributes: [NSAttributedStringKey.foregroundColor: UIColor.backButton(), NSAttributedStringKey.font: AppFonts.sfProTextRegular.withSize(17)])
    button.setAttributedTitle(attributedString, for: .normal)
}

func setNavBarBackButtonText(button: UIButton, buttonText: String) {
    let attributedString = NSMutableAttributedString(string: buttonText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.backButton(), NSAttributedStringKey.font: AppFonts.sfProTextRegular.withSize(17)])
    button.setAttributedTitle(attributedString, for: .normal)
}

func setNavBarRightButtonText(button: UIButton, buttonText: String) {
    let attributedString = NSMutableAttributedString(string: buttonText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.rightNavBarButton(), NSAttributedStringKey.font: AppFonts.sfProTextRegular.withSize(17)])
    button.setAttributedTitle(attributedString, for: .normal)
}

func setNavBarRightTitleText(label: UILabel, labelText: String) {
    let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: AppFonts.sfProTextSemiBold.withSize(17)])
    label.attributedText = attributedString
}

func setStepInfoLabelText(label: UILabel, labelText: String) {
    let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: AppFonts.avenirHeavy.withSize(16)])
    label.attributedText = attributedString
}

func setTextFieldAtrributedText(textField: UITextField, fieldText: String) {
    let attributedString = NSMutableAttributedString(string: fieldText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.termsAndCondition(), NSAttributedStringKey.font: AppFonts.avenirMedium.withSize(15)])
    textField.attributedText = attributedString
}

func setStepNumberLabelText(label: UILabel, labelText: String) {
    let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.stepNumberLabel(), NSAttributedStringKey.font: AppFonts.avenirHeavy.withSize(13)])
    label.attributedText = attributedString
}

func setTextFieldInfoLabelText(label: UILabel, labelText: String) {
    let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedStringKey.foregroundColor: UIColor.termsAndCondition(), NSAttributedStringKey.font: AppFonts.avenirHeavy.withSize(15)])
    label.attributedText = attributedString
}

func setLabelAttributedText(label: UILabel, labelText: String, font: UIFont, color: UIColor) {
    let attributedString = NSMutableAttributedString(string: labelText, attributes: [NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.font: font])
    label.attributedText = attributedString
}

func setButtonAttributedText(button: UIButton, buttonText: String, font: UIFont, color: UIColor) {
    let attributedString = NSMutableAttributedString(string: buttonText, attributes: [NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.font: font])
    button.setAttributedTitle(attributedString, for: .normal)
}

func setTextFieldAttributedText(textField: UITextField, textFieldText: String, font: UIFont, color: UIColor) {
    let attributedString = NSMutableAttributedString(string: textFieldText, attributes: [NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.font: font])
    textField.attributedText = attributedString
}

func showBanner(message: String, buttonTitle: String = "") {
    let banner = showBannerInBottom(with: message, buttonTitle: buttonTitle)
    banner.onTap = {
        Logger.info("banner tapped")
    }
}

func getOpenAndCloseTimeForDay(businesObj: Business, dayOfWeek: Int) -> (openTime: String, closeTime: String) {
    if (businesObj.businessOpeningHoursList?.count)! > 0 {
        let todayJob = businesObj.businessOpeningHoursList?.filter { (newJob) -> Bool in
            return (newJob.dayOfWeek == dayOfWeek - 1)
        }

        if (todayJob?.count)! > 0 {
            var openTime: String = ""
            var closetime: String = ""
            for index in 0 ..< (todayJob?.count)! {
                if index == 0 {
                    openTime = Date.UTCToLocal(UTCDateString: (todayJob![index].openTime)!, with: Date.dateFormatHHMM())
                }
                if index == (todayJob?.count)! - 1 {
                    closetime = Date.UTCToLocal(UTCDateString: (todayJob![index].closeTime)!, with: Date.dateFormatHHMM())
                }
            }

            return (openTime, closetime)
        }
        return ("Closed", "")
    }
    return ("Closed", "")
}

func getTimeForCreateJobRequest(jobModel: Job?) -> String {
    let timezone = TimeZone.current
    let datecom = Date.stringToDateForFormatter(date: (jobModel?.preferredDate)!, dateFormate: Date.dateFormatCCCCDDMMMYYYY(), timezone: TimeZone.current)
    let timecom = Date.stringToDateForFormatter(date: (jobModel?.preferredTime)!, dateFormate: "hh:mma", timezone: TimeZone.current)
    let dateWithComponent = Date.allDateComponents(date: datecom, timeZone: timezone)
    let timeWithComponent = Date.allDateComponents(date: timecom, timeZone: timezone)
    let dta = Date(year: dateWithComponent.year!, month: dateWithComponent.month!, day: dateWithComponent.day!, hour: timeWithComponent.hour!, minute: timeWithComponent.minute!, second: timeWithComponent.second!, timeZone: timezone)

    let dateInStrin = Date.dateToStringForFormatter(date: dta, dateFormate: Date.dateFormatYYYYMMDDHHMMSS(), timeZone: TimeZone.current)
    let toDate = Date.localToUTC(date: dateInStrin)
    return toDate
}

func getproposedDateForQuote(offerDate: String, offerTime: String) -> String {
    let timezone = TimeZone.current
    //    let dateForNew  = Date.toDateString(orignalDate: offerDate, inputDateFormat: Date.dateFormatEEEDDMMM(), ouputDateFormat: Date.dateFormatCCCCDDMMMYYYY())
    let datecom = Date.stringToDateForFormatter(date: offerDate, dateFormate: Date.dateFormatDDMMYYYYDashed(), timezone: timezone)
    let timecom = Date.stringToDateForFormatter(date: offerTime, dateFormate: "hh:mma", timezone: timezone)
    let dateWithComponent = Date.allDateComponents(date: datecom, timeZone: timezone)
    let timeWithComponent = Date.allDateComponents(date: timecom, timeZone: timezone)
    let dta = Date(year: dateWithComponent.year!, month: dateWithComponent.month!, day: dateWithComponent.day!, hour: timeWithComponent.hour!, minute: timeWithComponent.minute!, second: timeWithComponent.second!, timeZone: timezone)

    let dateInStrin = Date.dateToStringForFormatter(date: dta, dateFormate: Date.dateFormatYYYYMMDDHHMMSS(), timeZone: TimeZone.current)
    let toDate = Date.localToUTCNew(date: dateInStrin, fromFormat: Date.dateFormatYYYYMMDDHHMMSS(), toFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZZ") // localProposedToUTC(date: dateInStrin)
    return toDate
}

func setupLoadingMoreOnTable(tableView: UITableView) {
    let footer = LoadMoreView.loadMoreView()
    footer.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44)
    footer.layoutIfNeeded()
    footer.activityIndicator.startAnimating()
    tableView.tableFooterView = footer
}

func getTimeAndDateFromTimeStamp(time: String) -> (time: String, fullDate: String) {
    let date = Date.getDatefromTimeStamp(timestamp: time)
    let fulldate = Date.dateToString(date: date)
    let time = Date.dateToStringForFormatter(date: date, dateFormate: Date.dateFormatHHMM(), timeZone: TimeZone(abbreviation: "UTC")!)
    let strTime = Date.UTCToLocalNew(date: time, fromFormat: Date.dateFormatHHMM(), toFormat: Date.dateFormatHHMM())
    return (strTime, fulldate)
}

func getShortTimeAndDateFromTimeStamp(time: String) -> (time: String, fullDate: String) {
    let date = Date.getDatefromTimeStamp(timestamp: time)
    let fulldate = Date.shortDateToString(date: date)
    let timeloc = Date.dateToStringForFormatter(date: date, dateFormate: Date.dateFormatHHMM(), timeZone: TimeZone(abbreviation: "UTC")!)
    let strTime = Date.UTCToLocalNew(date: timeloc, fromFormat: Date.dateFormatHHMM(), toFormat: Date.dateFormatHHMM())
    return (strTime, fulldate)
}

//func getExpireTimeFromTimeStamp(time: String) -> DateComponents {
//    let expireDate = Date.getDatefromTimeStamp(timestamp: time)
//
//    //    let startDate = "2000-11-22"
//    //    let dateFormatter = DateFormatter()
//    //    dateFormatter.dateFormat = "yyyy-MM-dd"
//    //    let formatedStartDate = dateFormatter.date(from: startDate)
//    let currentDate = Date()
//    let components = Set<Calendar.Component>([.second, .minute, .hour, .day, .month, .year])
//    //    let differenceOfDate = Calendar.current.dateComponents(components, from: expireDate, to: currentDate)
//    let differenceOfDate = Calendar.current.dateComponents(components, from: currentDate, to: expireDate)
//    return differenceOfDate
//}

func getExpireTimeFromTimeStamp(time: String) -> DateComponents {
    let expireDate = Date.getDatefromTimeStamp(timestamp: time)

    let currentDate = Date()
    
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//    let dat = dateFormatter.string(from: Date())
//    //    dateFormatter.dateFormat = dateFormate // "dd MMMM yyyy"
//    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//    let newDate = dateFormatter.date(from: dat)!
    
    let components = Set<Calendar.Component>([.second, .minute, .hour, .day, .month, .year])
//    let differenceOfDate = Calendar.current.dateComponents(components, from: expireDate)
    let differenceOfDate = Calendar.current.dateComponents(components, from: currentDate, to: expireDate)
    return differenceOfDate
}

func getLongTimeAndDateFromTimeStamp(time: String) -> (time: String, fullDate: String) {
    let date = Date.getDatefromTimeStamp(timestamp: time)
    let fulldate = Date.longDateToString(date: date)
    let time = Date.dateToStringForFormatter(date: date, dateFormate: Date.dateFormatHHMM(), timeZone: TimeZone.current)
    return (time, fulldate)
}

func getIPAddress() -> String? {
    var address: String?
    var ifaddr: UnsafeMutablePointer<ifaddrs>?
    if getifaddrs(&ifaddr) == 0 {
        var ptr = ifaddr
        while ptr != nil {
            defer { ptr = ptr?.pointee.ifa_next }

            let interface = ptr?.pointee
            let addrFamily = interface?.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)
    }
    return (address == nil) ? "172.16.20.228" : address
}

/*

 func getIPAddress() -> String? {
 var addresses = [String]()

 // Get list of all interfaces on the local machine:
 var ifaddr : UnsafeMutablePointer<ifaddrs>?
 guard getifaddrs(&ifaddr) == 0 else { return nil}
 guard let firstAddr = ifaddr else { return nil }

 // For each interface ...
 for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
 let flags = Int32(ptr.pointee.ifa_flags)
 let addr = ptr.pointee.ifa_addr.pointee

 // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
 if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
 if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {

 // Convert interface address to a human readable string:
 var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
 if (getnameinfo(ptr.pointee.ifa_addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),
 nil, socklen_t(0), NI_NUMERICHOST) == 0) {
 let address = String(cString: hostname)
 addresses.append(address)
 }
 }
 }
 }

 freeifaddrs(ifaddr)
 return (addresses.first != nil) ? addresses.first : nil
 }
 */
