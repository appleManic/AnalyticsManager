//
//  WebEngageAnalyticsService.swift
//  AnalyticsService
//
//  Created by Pawan Selokar on 14/03/24..
//


import Foundation
import WebEngage

class WebEngageAnalyticsService:AnalyticsService {
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        
    }
    
    func track(event: AnalyticsEvent, params: [String : Any]?) {
        let userid = KeyManager.sharedInstance.getUserID()
        let everntParameters = event.parameters
        var parameters = [String : Any]()
        if let params = params {
            parameters = params
        }
        
        parameters["userid"] = "\(userid)"
        
        if let dict1 = everntParameters {
            parameters =  dict1.merging(parameters) { (_, new) in new }
        }
        
        let weAnalytics: WEGAnalytics = WebEngage.sharedInstance().analytics
        weAnalytics.trackEvent(withName: event.name, andValue: parameters)
    }
    
    func setUser() {
        setWebengageData { webengageModel in
            guard let webengageData = webengageModel else {return}
            if let model = KeyManager.sharedInstance.getUserProfileDataModel(){
                let token = UserDefaultManager.standard.fcmToken
                if let weUser:WEGUser = WebEngage.sharedInstance()?.user{
                    weUser.login("\(model.userid.orEmpty)")
                    weUser.setAttribute("id", withStringValue: "\(model.userid.orEmpty)")
                    weUser.setAttribute("name", withStringValue: webengageData.name.orEmpty)
                    let editedISDCode = model.isdcode.orEmpty.replacingOccurrences(of: "+", with: "")
                    weUser.setAttribute("isdcode", withStringValue:"+\(editedISDCode)")
                    weUser.setEmail("\(model.email.orEmpty)")
                    weUser.setPhone("+\(editedISDCode)\(model.phone.orEmpty)")
                    weUser.setAttribute("deviceid", withStringValue: CommonMethods.udid)
                    weUser.setAttribute("os", withStringValue: "iOS")
                    weUser.setAttribute("tokenid", withStringValue: token)
                    weUser.setAttribute("created", withStringValue: webengageData.created ?? "")
                    weUser.setAttribute("modified", withStringValue: webengageData.modified ?? "")
                    weUser.setAttribute("devicemodel", withStringValue: UIDevice.modelName)
                    weUser.setAttribute("appversion", withStringValue: CommonMethods.appVersion)
                    weUser.setAttribute("yob", withValue: NSNumber(value: model.yob.orEmpty))
                    weUser.setAttribute("gender", withStringValue: model.gender.orEmpty)
                    weUser.setAttribute("height", withStringValue: "\(model.height.orEmpty)")
                    weUser.setAttribute("weight", withStringValue: "\(webengageData.weight.orEmpty)")
                    weUser.setAttribute("hba1c", withStringValue: "\(webengageData.hba1c.orEmpty)")
                    weUser.setAttribute("beendiabeticfor", withStringValue: webengageData.beendiabeticfor ?? "")
                    weUser.setAttribute("emailblacklisted", withStringValue: webengageData.emailblacklisted ?? "")
                    
                    weUser.setAttribute("wallet", withStringValue: "\(webengageData.wallet.orEmpty)")
                    weUser.setAttribute("cashback", withStringValue: "\(webengageData.cashback.orEmpty)")
                    weUser.setAttribute("cashback", withStringValue: "\(webengageData.cashback.orEmpty)")
                    weUser.setAttribute("totalcashback", withStringValue: "\(webengageData.totalcashback.orEmpty)")
                    weUser.setAttribute("segment", withStringValue: webengageData.segment.orEmpty)
                    weUser.setAttribute("laststrippurchase", withStringValue: webengageData.laststrippurchase.orEmpty)
                    weUser.setAttribute("glucodevicetype", withStringValue: webengageData.userTypeDevice.orEmpty)
                    weUser.setAttribute("lastlabpurchase", withStringValue: webengageData.lastlabpurchase.orEmpty)
                    weUser.setAttribute("segment", withStringValue: webengageData.segment.orEmpty)
                    weUser.setAttribute("BP", withStringValue: webengageData.bp ?? "")
                    weUser.setAttribute("Onboarding_SelectDiabetic_Type", withStringValue: webengageData.onboardingSelectDiabeticType.orEmpty)
                    weUser.setAttribute("deviceActivatedStatus",  withValue: NSNumber(booleanLiteral:webengageData.deviceActivatedStatus ?? false))
                    weUser.setAttribute("devicePurchase", withValue: NSNumber(booleanLiteral:webengageData.devicePurchase ?? false))
                    weUser.setAttribute("subscription", withValue: NSNumber(booleanLiteral:webengageData.subscription ?? false))
                    weUser.setAttribute("lastmedpurchase", withStringValue: "\(webengageData.lastmedpurchase.orEmpty)")
                    weUser.setAttribute("glucodevicenumber", withStringValue: "\(webengageData.glucometerid.orEmpty)")
                    weUser.setAttribute("deviceDelivered", withValue: NSNumber(value:webengageData.deviceDelivered ?? 0))
                    weUser.setAttribute("stripUtilization", withValue: NSNumber(value: webengageData.stripUtilization ?? 0))
                    weUser.setAttribute("lastDeviceReading", withDateValue: webengageData.lastDeviceReading?.toDate(format: "yyyy-MM-dd"))
                    weUser.setAttribute("partnercode", withStringValue: "\(webengageData.partnercode.orEmpty)")
                    let flag = webengageData.ownsglucometer == "yes" ? true : false
                    weUser.setAttribute("ownsglucometer",  withValue: NSNumber(booleanLiteral:flag))
                }
            }
        }
    }
    
    func unsetUser() {
        
    }
    
    //MARK: - Private functions
    private func setWebengageData(_ completion:@escaping ((WebengageModel?)->Void)){
        WebEngageService().getWebengageData{ result in
            switch result {
            case .success( let response):
                print("Webengage user tracking success")
                completion(response)
            case .failure( _):
                print("Webengage user tracking failure")
                completion(nil)
            }
        }
    }
    
    
}
