//
//  AppNavigations.swift
//  Geenie
//  Created by Prince on 04/12/17.
//  Copyright © 2017 Appster. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {

    func popToRootViewController() {
        _ = navigationController?.popToRootViewController(animated: false)
    }

    @IBAction func popViewController() {
        _ = navigationController?.popViewController(animated: true)
    }

    // MARK: Show Loader
    func showHUDLoader(view: UIView, message: String) {
        view.isUserInteractionEnabled = false
        DispatchQueue.main.async {
            let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
            loadingNotification.mode = MBProgressHUDMode.indeterminate
            loadingNotification.label.text = message
        }
    }

    // MARK: Hide Loader
    func hideHUDLoader(view: UIView) {
        view.isUserInteractionEnabled = true
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: view, animated: true)
        }
    }

    /**
     Present alert with ok  buttton only.

     - parameter title:     String which show as title
     - parameter message :  String which show as message
     - parameter handler:   Callback action to handle action

     - returns:  Completion handler returns callback to function
     */
    func alertWithOk(_ title: String, message: String, handler: ((UIAlertAction?) -> Void)? = nil) -> UIAlertController {

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: UIAlertActionStyle.default, handler: handler))
        return alert
    }

    func pushToSignUpViewController(profileType: ProfileType) {
        if let signUpViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.signUpViewController.rawValue) as? SignUpViewController {

            signUpViewController.profileType = profileType

            //            navigationController?.pushViewController(signUpViewController, animated: true)

            signUpViewController.modalPresentationStyle = .overCurrentContext
            let navController = UINavigationController(rootViewController: signUpViewController)
            navController.hidesBottomBarWhenPushed = true
            navController.setNavigationBarHidden(true, animated: false)
            navigationController?.present(navController, animated: true, completion: {
                // Success
            })
        }
    }

    func pushToTermViewController() {
        if let termViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.termsOrPrivacyPolicyViewController.rawValue) as? TermsOrPrivacyPolicyViewController {
            termViewController.webPageType = .termsAndCondition
            navigationController?.pushViewController(termViewController, animated: true)
        }
    }

    func pushToPrivacyViewController() {
        if let privacyViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.termsOrPrivacyPolicyViewController.rawValue) as? TermsOrPrivacyPolicyViewController {
            privacyViewController.webPageType = .privacy
            navigationController?.pushViewController(privacyViewController, animated: true)
        }
    }

    func pushToCreateProfileViewController(profileType: ProfileType) {
        if let createProfileViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.createProfileViewController.rawValue) as? CreateProfileViewController {
            createProfileViewController.profileType = profileType
            navigationController?.pushViewController(createProfileViewController, animated: true)
        }
    }

    func pushToProfileDetailsViewController(profileType: ProfileType, isEdit: Bool, isCameFromSignUp: Bool) {
        if let profileDetailsViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.profileDetailsViewController.rawValue) as? ProfileDetailsViewController {
            profileDetailsViewController.profileType = profileType
            profileDetailsViewController.isEdit = isEdit
            profileDetailsViewController.isCameFromSignUp = isCameFromSignUp
            profileDetailsViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(profileDetailsViewController, animated: true)
        }
    }

    func pushToBuisnessProfileDetailViewController(isEdit: Bool, isCameFromSignUp: Bool) {
        if let buisnessProfileDetailViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.buisnessProfileDetailViewController.rawValue) as? BuisnessProfileDetailViewController {
            buisnessProfileDetailViewController.isEdit = isEdit
            buisnessProfileDetailViewController.isCameFromSignUp = isCameFromSignUp
            buisnessProfileDetailViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(buisnessProfileDetailViewController, animated: true)
        }
    }

    func pushToOpeningHoursProfileViewController(isEdit: Bool) {
        if let openingHoursProfileViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.openingHoursProfileViewController.rawValue) as? OpeningHoursProfileViewController {
            openingHoursProfileViewController.isEdit = isEdit
            openingHoursProfileViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(openingHoursProfileViewController, animated: true)
        }
    }

    func pushToOpeningHoursChildViewController() {
        if let openingHoursChildViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.openingHoursChildViewController.rawValue) as? OpeningHoursChildViewController {
            openingHoursChildViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(openingHoursChildViewController, animated: true)
        }
    }

    func pushToPickServicesViewController(isEdit: Bool) {
        if let pickServicesViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.pickServicesViewController.rawValue) as? PickServicesViewController {
            pickServicesViewController.isEdit = isEdit
            pickServicesViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(pickServicesViewController, animated: true)
        }
    }

    func pushToVerifyPhoneViewController(profileType: ProfileType, isEdit: Bool) {
        if let verifyPhoneViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.verifyPhoneViewController.rawValue) as? VerifyPhoneViewController {
            verifyPhoneViewController.profileType = profileType
            verifyPhoneViewController.isEdit = isEdit
            verifyPhoneViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(verifyPhoneViewController, animated: true)
        }
    }

    func pushToEnterOTPViewController(phoneNumber: String, profileType: ProfileType, isEdit: Bool) {
        if let enterOTPViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.enterOTPViewController.rawValue) as? EnterOTPViewController {
            enterOTPViewController.selectedPhoneNumber = phoneNumber
            enterOTPViewController.profileType = profileType
            enterOTPViewController.isEdit = isEdit
            enterOTPViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(enterOTPViewController, animated: true)
        }
    }

    func pushToBusinessProfileCompleteViewController(profileType: ProfileType, showAccountVerified: Bool) {
        if let businessProfileCompleteViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessProfileCompleteViewController.rawValue) as? BusinessProfileCompleteViewController {
            businessProfileCompleteViewController.profileType = profileType
            businessProfileCompleteViewController.showAccountVerified = showAccountVerified
            businessProfileCompleteViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(businessProfileCompleteViewController, animated: true)
        }
    }

    func pushToSwitchToCustmerViewController(callingObj: UIViewController, profileType: ProfileType) {
        if let switchToCustmerViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.switchToCustmerViewController.rawValue) as? SwitchToCustmerViewController {
            switchToCustmerViewController.modalPresentationStyle = .overCurrentContext
            switchToCustmerViewController.callingObject = callingObj
            switchToCustmerViewController.profileType = profileType
            navigationController?.present(switchToCustmerViewController, animated: true, completion: {
                // Success
            })
        }
    }

    func pushToSignInViewController(profileType: ProfileType) {
        if let signInViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.signInViewController.rawValue) as? SignInViewController {
            signInViewController.profileType = profileType
            navigationController?.pushViewController(signInViewController, animated: true)
        }
    }

    func pushToBusinessTypeViewController() {
        if let businessTypeViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessTypeViewController.rawValue) as? BusinessTypeViewController {
            businessTypeViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(businessTypeViewController, animated: true)
        }
    }

    func pushToBusinessSearchListViewController(searchList: ListingWithPagination<Business>, job: Job) {
        if let businessTypeViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessSearchListViewController.rawValue) as? BusinessSearchListViewController {
            businessTypeViewController.hidesBottomBarWhenPushed = true
            businessTypeViewController.listingWithPagination = searchList
            businessTypeViewController.job = job
            navigationController?.pushViewController(businessTypeViewController, animated: true)
        }
    }

    func pushToCreateJobViewController(jobModel: Job, cellArray: [CreateJobCellType], business: Business?, forView: ViewType) {
        if let createJobViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.createJobViewController.rawValue) as? CreateJobViewController {
            createJobViewController.job = jobModel
            createJobViewController.tottalCells = cellArray
            createJobViewController.seledtedBusiness = business
            createJobViewController.viewType = forView
            createJobViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(createJobViewController, animated: true)
        }
    }

    func pushToChooseCatgoryViewController(business: Business) {
        if let chooseViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.chooseCategory.rawValue) as? ChooseCategoryViewController {
            chooseViewController.selectedBusiness = business
            chooseViewController.list = business.businessCategoryList!
            chooseViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(chooseViewController, animated: true)
        }
    }

    func pushToCustomerJobDetailViewController(jobObj: Job) {
        if let customerJobDetailViewController = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.customerJobDetailViewController.rawValue) as? CustomerJobDetailViewController {
            customerJobDetailViewController.jobObj = jobObj
            customerJobDetailViewController.delegate = self as? MyJobsViewController
            customerJobDetailViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(customerJobDetailViewController, animated: true)
        }
    }

    func pushToCustomerFinalPriceViewController(jobObj: Job, isCompleteMark: Bool?) {
        if let customerJobDetailViewController = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.customerFinalPriceViewController.rawValue) as? CustomerFinalPriceViewController {
            customerJobDetailViewController.job = jobObj
            customerJobDetailViewController.markComplete = isCompleteMark
            customerJobDetailViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(customerJobDetailViewController, animated: true)
        }
    }

    func pushToSearchByBusinessNameViewController() {
        if let businessSearchByNameViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessSearchByNameViewController.rawValue) as? BusinessSearchByNameViewController {
            businessSearchByNameViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(businessSearchByNameViewController, animated: true)
        }
    }

    func pushToBusinessDetailViewController(job: Job?, and business: Business?, requestButtonHidden: Bool) {
        if let businessDetailViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessDetailViewController.rawValue) as? BusinessDetailViewController {
            businessDetailViewController.hidesBottomBarWhenPushed = true
            businessDetailViewController.businesObj = business
            businessDetailViewController.job = job
            businessDetailViewController.isRequestButtonHidden = requestButtonHidden
            navigationController?.pushViewController(businessDetailViewController, animated: true)
        }
    }

    // MARK: - TabBar Storyboard
    func pushToCustomerTabBarViewController() {
        if let tabBarViewController = UIStoryboard.customerTabBarStoryBoard().instantiateViewController(withIdentifier: "CustomerTabbar") as? CustomerTabbar {
            kAppDelegate?.window?.rootViewController = nil
            kAppDelegate?.window?.rootViewController = tabBarViewController
        }
    }

    func pushToLocationViewController(controller: UIViewController) {
        if let locationSearchViewController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.locationSearchViewController.rawValue) as? LocationSearchViewController {
            locationSearchViewController.delegate = controller as? LocationSearchDelegate
            locationSearchViewController.hidesBottomBarWhenPushed = true

            controller.present(locationSearchViewController, animated: true, completion: nil)
        }
    }

    func pushToBookingEstimateViewContrller(job: Job) {
        if let quoteDetail = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.bookingEstimateListViewController.rawValue) as? BookingEstimateListViewController {
            quoteDetail.jobId = job.jobId
            quoteDetail.job = job
            quoteDetail.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(quoteDetail, animated: true)
        }
    }

    func pushToNextBookingViewContrller(job: Job) {
        if let quoteDetail = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.nextJobComfirmationViewController.rawValue) as? NextJobComfirmationViewController {
            quoteDetail.job = job
            quoteDetail.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(quoteDetail, animated: true)
        }
    }

    func pushToRescheduleJobViewContrller(job: Job) {
        if let quoteDetail = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.rescheduleJobViewController.rawValue) as? RescheduleJobViewController {
            quoteDetail.job = job
            quoteDetail.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(quoteDetail, animated: true)
        }
    }

    func pushToReviseViewContrller() {
        if let quoteDetail = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.revisingJobViewController.rawValue) as? RevisingJobViewController {
            quoteDetail.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(quoteDetail, animated: true)
        }
    }

    func pushToPaymentViewContrller() {
        if let paymentVC = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.paymentViewController.rawValue) as? PaymentViewController {
            paymentVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(paymentVC, animated: true)
        }
    }

    func pushToSendQuoteDetailViewController(jobQuote: JobQuote) {
        if let quoteDetail = UIStoryboard.businessJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessQuoteViewController.rawValue) as? JobQuoteVC {
            quoteDetail.jobQuote = jobQuote
            quoteDetail.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(quoteDetail, animated: true)
        }
    }

    func pushToBusinessJobDetailViewController(jobQuote: JobQuote?, job: Job?, isforView: Bool) {
        if let businessDetail = UIStoryboard.businessJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessJobDetail.rawValue) as? BusinessJobDetailViewController {
            businessDetail.jobQuote = jobQuote
            businessDetail.isForJob = isforView
            businessDetail.jobObj = job
            businessDetail.hidesBottomBarWhenPushed = true

            navigationController?.pushViewController(businessDetail, animated: true)
        }
    }

    func pushToBusinessSendFinalPriceViewController(job: Job?, jobQuote: JobQuote?) {
        if let sendDinalPriceViewController = UIStoryboard.businessJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.sendFinalPriceViewController.rawValue) as? SendFinalPriceViewController {
            sendDinalPriceViewController.job = job
            sendDinalPriceViewController.jobQuote = jobQuote
            sendDinalPriceViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(sendDinalPriceViewController, animated: true)
        }
    }

    func pushToQuoteDateTimeViewController(jobQuote: JobQuote, quotePriceType: QuotePriceType?) {
        if let quoteDetail = UIStoryboard.businessJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessQuoteDateTimeController.rawValue) as? QuoteDateTimeVC {
            quoteDetail.jobQuote = jobQuote
            quoteDetail.quotePriceType = quotePriceType
            quoteDetail.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(quoteDetail, animated: true)
        }
    }

    func pushToQuoteReviewViewController(jobQuote: JobQuote, withDate: String, quotePriceType: QuotePriceType?) {
        if let quoteDetail = UIStoryboard.businessJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessReviewQuoteController.rawValue) as? ReviewOfferVC {
            quoteDetail.jobQuote = jobQuote
            quoteDetail.finalDate = withDate
            quoteDetail.quotePriceType = quotePriceType
            quoteDetail.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(quoteDetail, animated: true)
        }
    }

    // MARK: - TabBar Storyboard
    func pushToBusinessTabBarViewController() {
        if let tabBarViewController = UIStoryboard.businessTabBarStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessTabbar.rawValue) as? BusinesstabBar {
            kAppDelegate?.window?.rootViewController = nil
            kAppDelegate?.window?.rootViewController = tabBarViewController
        }
    }

    func pushToBusinessJobViewController() {
        if let business = UIStoryboard.businessJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessJobs.rawValue) as? BusinessJobsViewController {
            business.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(business, animated: true)
        }
    }

    func pushToChangePasswordViewController() {
        if let changePasswordViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.changePasswordViewController.rawValue) as? ChangePasswordViewController {
            changePasswordViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(changePasswordViewController, animated: true)
        }
    }

    func pushToForgotPasswordViewController() {
        if let forgotPasswordViewController = UIStoryboard.loginStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.forgotPasswordViewController.rawValue) as? ForgotPasswordViewController {
            forgotPasswordViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(forgotPasswordViewController, animated: true)
        }
    }

    func pushToAddCardDetailsViewContrller(isEdit: Bool) {
        if let paymentVC = UIStoryboard.paymentStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.addCardDetails.rawValue) as? AddCardDetailsViewController {
            paymentVC.isEdit = isEdit
            paymentVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(paymentVC, animated: true)
        }
    }

    func pushBankDetailsFirstController(isEdit: Bool) {
        if let bankDetailsFirstController = UIStoryboard.paymentStoryBoard().instantiateViewController(withIdentifier: "BankDetailsFirstController") as? BankDetailsFirstController {
            bankDetailsFirstController.isEdit = isEdit
            bankDetailsFirstController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(bankDetailsFirstController, animated: true)
        }
    }

    func pushEditBankDetailsViewController() {
        if let bankDetailsFirstController = UIStoryboard.paymentStoryBoard().instantiateViewController(withIdentifier: "EditBankDetailsViewController") as? EditBankDetailsViewController {
            bankDetailsFirstController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(bankDetailsFirstController, animated: true)
        }
    }

    func pushBankDetailsSecondController(isEdit: Bool) {
        if let bankDetailSecondController = UIStoryboard.paymentStoryBoard().instantiateViewController(withIdentifier: "BankDetailsSecondController") as? BankDetailsSecondController {
            bankDetailSecondController.isEdit = isEdit
            bankDetailSecondController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(bankDetailSecondController, animated: true)
        }
    }

    func pushUpdateCardViewController(card: Card) {
        if let updateCardViewController = UIStoryboard.paymentStoryBoard().instantiateViewController(withIdentifier: "UpdateCardViewController") as? UpdateCardViewController {
            updateCardViewController.card = card
            updateCardViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(updateCardViewController, animated: true)
        }
    }

    func pushToRatingViewController(job: Job?, isNextBooking: Bool?) {
        if let ratingViewController = UIStoryboard.feedbackStoryBoard().instantiateViewController(withIdentifier: "RatingViewController") as? RatingViewController {
            ratingViewController.job = job
            ratingViewController.hidesBottomBarWhenPushed = true
            ratingViewController.shouldShowNextBooking = isNextBooking
            navigationController?.pushViewController(ratingViewController, animated: true)
        }
    }

    func pushToDisputeStartViewController(job: Job?) {
        if let disputeStartViewController = UIStoryboard.feedbackStoryBoard().instantiateViewController(withIdentifier: "DisputeStartViewController") as? DisputeStartViewController {
            disputeStartViewController.job = job
            disputeStartViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(disputeStartViewController, animated: true)
        }
    }

    func pushDisputeViewController(job: Job?) {
        if let disputeViewController = UIStoryboard.feedbackStoryBoard().instantiateViewController(withIdentifier: "DisputeViewController") as? DisputeViewController {
            disputeViewController.job = job
            disputeViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(disputeViewController, animated: true)
        }
    }

    func pushToReportUserViewController(job: Job?, jobQuote: JobQuote?) {
        if let reportUserViewController = UIStoryboard.feedbackStoryBoard().instantiateViewController(withIdentifier: "ReportUserViewController") as? ReportUserViewController {
            reportUserViewController.job = job
            reportUserViewController.jobQuote = jobQuote
            reportUserViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(reportUserViewController, animated: true)
        }
    }

    func pushtoConsumerCompleteJobViewController(job: Job) {
        if let consumerCompleteJobViewController = UIStoryboard.myJobsStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.consumerCompleteJobViewController.rawValue) as? ConsumerCompleteJobViewController {
            consumerCompleteJobViewController.job = job
            consumerCompleteJobViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(consumerCompleteJobViewController, animated: true)
        }
    }

    func pushToCustomerInformationViewController() {
        if let customerInformationViewController = UIStoryboard.tutorialStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.customerInformationViewController.rawValue) as? CustomerInformationViewController {
            customerInformationViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(customerInformationViewController, animated: true)
        }
    }

    func pushToBusinessInformationViewController() {
        if let businessInformationViewController = UIStoryboard.tutorialStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.businessInformationViewController.rawValue) as? BusinessInformationViewController {
            businessInformationViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(businessInformationViewController, animated: true)
        }
    }

    func pushToSettingsOnboardingViewController() {
        if let settingsOnboardingViewController = UIStoryboard.tutorialStoryBoard().instantiateViewController(withIdentifier: UIStoryboard.StoryboardViewControllerIdentifier.settingsOnboardingViewController.rawValue) as? SettingsOnboardingViewController {
            settingsOnboardingViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(settingsOnboardingViewController, animated: true)
        }
    }
}
