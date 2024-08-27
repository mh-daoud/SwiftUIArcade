//
//  ApiService.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import Foundation
import UIKit



enum APIEndpoint {
    case getCards
    case authenticateUser(_ request: AuthRequst)
    
    var path: String {
        switch self {
        case .authenticateUser:
            return "/loginWithOtp/"
        case .getCards:
            return "/getCards"
        }
    }
    
    var method: String {
        switch self {
        default:
            return "POST"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case let .authenticateUser(request):
            let appID = Bundle.main.bundleIdentifier!
            let deviceModel = UIDevice.modelName
            let ipAddress = UIDevice.current.ipAddress()
            let osVersion = UIDevice.current.systemVersion
            let appVersion = Bundle.main.releaseVersionNumber ?? ""
            return [
                "operationName": "Login",
                "variables": [
                    "data": [
                        "appID":  appID,
                        "deviceOS": "ios",
                        "deviceId": request.deviceId,
                        "userAgent": "unknown",
                        "deviceOSVersion": osVersion,
                        "deviceType": "Handset",
                        "deviceVendor": "Apple",
                        "deviceModel": deviceModel,
                        "language": "en",//to be read from system ui
                        "gpsType": "A",
                        "gpsCoords": "",
                        "deviceToken": request.faceIdToken,
                        "payLoad": request.payload,
                        "ipAddress": ipAddress,
                        "appVersion": appVersion,
                        "username": request.username,
                        "password": request.password,
                        "channelID": "NRIB"
                    ]
                ],
                "query": "mutation Login($data: AuthenticationRequestInput!) {\n  login(input: {authenticationRequest: $data}) {\n    result { \n accessToken {\n        expiry\n        token\n }\n      refreshToken {\n        expiry\n        token\n        }\n   }\n  }\n}"
            ]
        case .getCards:
            return [
                "operationName": "CardsList",
                "variables": [String: String](),
                "query": "query CardsList {\n  user {\n    accounts {\n      madaCards {\n        accountNumber\n        embossedName\n        maskedNumber\n        status\n        category\n        token\n        expiry\n }\n      }\n  }\n}"
            ]
        }
    }
}
