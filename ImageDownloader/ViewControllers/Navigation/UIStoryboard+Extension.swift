//
//  StoryBoardIdentifier.swift
//  Geenie
//
//  Created by Prince on 04/12/17.
//  Developed by Appster. All rights reserved.
//

// ---------------- This class is used for all StoryBoards Identifers (SB)  in the the app ---------------------------------------

import Foundation
import UIKit

extension UIStoryboard {

    enum StoryboardNames: String {

        case login = "Login"
        case tutorial = "Tutorial"
        case settings = "Settings"
        case notification = "Notification"
        case customerTabbar = "CustomerTabbar"
        case myJobs = "MyJobs"
        case more = "More"
        case businessJobs = "BusinessJobs"
        case businessTabBar = "BusinessTabbar"
        case payment = "Payment"
        case feedback = "Feedback"
    }

    // ------------------------------- View Controller Identifier -----------------------

    enum StoryboardViewControllerIdentifier: String {

        case signInViewController = "SignInViewController"
        case signUpViewController = "SignUpViewController"
        case termsOrPrivacyPolicyViewController = "TermsOrPrivacyPolicyViewController"
        case createProfileViewController = "CreateProfileViewController"
        case profileDetailsViewController = "ProfileDetailsViewController"
        case buisnessProfileDetailViewController = "BuisnessProfileDetailViewController"
        case openingHoursProfileViewController = "OpeningHoursProfileViewController"
        case openingHoursChildViewController = "OpeningHoursChildViewController"
        case pickServicesViewController = "PickServicesViewController"
        case verifyPhoneViewController = "VerifyPhoneViewController"
        case enterOTPViewController = "EnterOTPViewController"
        case businessProfileCompleteViewController = "BusinessProfileCompleteViewController"
        case switchToCustmerViewController = "SwitchToCustmerViewController"
        case bankAccountViewController = "BankAccountViewController"
        case pageViewController = "PageViewController"
        case businessTypeViewController = "BusinessTypeViewController"
        case businessSearchListViewController = "BusinessSearchListViewController"
        case createJobViewController = "CreateJobViewController"
        case locationSearchViewController = "LocationSearchViewController"
        case businessSearchByNameViewController = "BusinessSearchByNameViewController"
        case businessDetailViewController = "BusinessDetailViewController"
        case customerJobDetailViewController = "CustomerJobDetailViewController"
        case customerFinalPriceViewController = "CustomerFinalPriceViewController"
        case businessQuoteViewController = "kBusinessQuoteViewController"
        case businessQuoteDateTimeController = "kBusinessQuoteDateTimeController"
        case businessReviewQuoteController = "kBusinessReviewQuoteController"
        case bookingEstimateListViewController = "BookingEstimateListViewController"
        case revisingJobViewController = "RevisingJobViewController"
        case paymentViewController = "PaymentViewController"
        case businessTabbar
        case businessJobDetail = "BusinessJobDetailViewController"
        case sendFinalPriceViewController = "SendFinalPriceViewController"
        case chooseCategory = "ChooseCategoryViewController"
        case businessJobs = "BusinessJobsViewController"
        case addCardDetails = "AddCardDetails"
        case changePasswordViewController = "ChangePasswordViewController"
        case forgotPasswordViewController = "ForgotPasswordViewController"
        case consumerCompleteJobViewController = "ConsumerCompleteJobViewController"
        case nextJobComfirmationViewController = "NextJobComfirmationViewController"
        case rescheduleJobViewController = "RescheduleJobViewController"
        case onboardingViewController = "OnboardingViewController"
        case customerInformationViewController = "CustomerInformationViewController"
        case businessInformationViewController = "BusinessInformationViewController"
        case settingsOnboardingViewController = "SettingsOnboardingViewController"
    }

    // MARK: Get App StoryBoards  ------------------------------

    class func loginStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.login.rawValue, bundle: nil)
        return storyboard
    }

    class func feedbackStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.feedback.rawValue, bundle: nil)
        return storyboard
    }

    class func tutorialStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.tutorial.rawValue, bundle: nil)
        return storyboard
    }

    class func settingsStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.settings.rawValue, bundle: nil)
        return storyboard
    }

    class func notificationStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.notification.rawValue, bundle: nil)
        return storyboard
    }

    class func customerTabBarStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.customerTabbar.rawValue, bundle: nil)
        return storyboard
    }

    class func myJobsStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.myJobs.rawValue, bundle: nil)
        return storyboard
    }

    class func moreStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.more.rawValue, bundle: nil)
        return storyboard
    }

    class func businessJobsStoryBoard() -> UIStoryboard {
        let storyboard: UIStoryboard = UIStoryboard(name: StoryboardNames.businessJobs.rawValue, bundle: nil)
        return storyboard
    }

    class func businessTabBarStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: StoryboardNames.businessTabBar.rawValue, bundle: nil)
    }

    class func paymentStoryBoard() -> UIStoryboard {
        return UIStoryboard(name: StoryboardNames.payment.rawValue, bundle: nil)
    }
}
