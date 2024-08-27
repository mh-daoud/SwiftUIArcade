//
//  Bundle+Utils.swift
//  RibPlayground
//
//  Created by SAIB on 11/02/1446 AH.
//

import Foundation

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
