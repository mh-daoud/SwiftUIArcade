//
//  BiometricGenerator.swift
//  RibPlayground
//
//  Created by SAIB on 10/02/1446 AH.
//

import Foundation
import Security

class KeychainUtil {
    
    static let shared = KeychainUtil()
    
    private init() {}
    
    struct KeychainConfiguration {
        static let biometricKeyAlias = "com.rnbiometrics.biometricKey"
        static let accessGroup = "group.com.saib.mobile.retail"
        static let accessService = "com.saib.mobile.retail.service"
       
    }
    
    enum KeychainKey: String {
        case walletExtensionUser = "walletExtensionUser"
        case enabledBiometricLogin = "enabledBiometricLogin"
        case deviceId = "NRIBDEVICEUUID"
    }
    
    
    private func getBiometricKeyTag() -> NSData? {
        let biometricKeyAlias = KeychainConfiguration.biometricKeyAlias
        guard let biometricKeyTag =  biometricKeyAlias.data(using: .utf8) as? NSData else {
            return nil
        }
        return biometricKeyTag;
    }
    
    func getItem<T>(key: KeychainKey) -> T? where T: Codable  {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecAttrAccessGroup as String: KeychainConfiguration.accessGroup, // The shared access group
            kSecReturnData as String: kCFBooleanTrue!
        ]
        
        // Initialize a variable to hold the returned item
        var item: CFTypeRef?
        
        // Perform the search query
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        // Check the result
        if status == errSecSuccess {
            // If successful, convert the retrieved data to a String
            if let data = item as? Data {
                let enabledBiometric = try? JSONDecoder().decode(T.self, from: data)
                if let enabledBiometric {
                    return enabledBiometric
                }
            }
            
        } else {
            // Handle errors or the case where no data was found
            print("Error reading keychain data: \(status)")
        }
        return nil
    }
    
//    func getWalletExtensionUser() -> WalletExtensionUser? {
//        let query: [String: Any] = [
//            kSecClass as String: kSecClassGenericPassword,
//            kSecAttrAccount as String: KeychainKey.walletExtensionUser,
//            kSecAttrAccessGroup as String: KeychainConfiguration.accessGroup, // The shared access group
//            kSecReturnData as String: kCFBooleanTrue!, // Request to return the data
//            kSecMatchLimit as String: kSecMatchLimitOne
//        ]
//        
//        // Initialize a variable to hold the returned item
//        var item: CFTypeRef?
//        
//        // Perform the search query
//        let status = SecItemCopyMatching(query as CFDictionary, &item)
//        
//        // Check the result
//        if status == errSecSuccess {
//            // If successful, convert the retrieved data to a String
//            if let data = item as? Data {
//                let user = try? JSONDecoder().decode(WalletExtensionUser.self, from: data)
//                return user
//            }
//            
//        } else {
//            // Handle errors or the case where no data was found
//            print("Error reading keychain data: \(status)")
//        }
//        return nil
//    }
    
    func signPayload(payload: String, promptMessage: String) -> String? {
        guard let biometricKeyTag = getBiometricKeyTag() else {
            print("Failed to get biometric key tag")
            return nil
        }
        
        // Construct the query dictionary
        let query: [String: Any] = [
            kSecClass as String: kSecClassKey,
            kSecAttrApplicationTag as String: biometricKeyTag,
            kSecAttrAccessGroup as String: KeychainConfiguration.accessGroup, // The shared access group
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecReturnRef as String: kCFBooleanTrue,
            kSecUseOperationPrompt as String: promptMessage
        ]
        
        var item: AnyObject?
        var privateKey: SecKey? = nil
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        if status == errSecSuccess {
            privateKey = (item as! SecKey)
            // Convert the payload to Data
            guard let dataToSign = payload.data(using: .utf8), let privateKey else {
                print("Failed to convert payload to Data")
                return nil
            }
            
            // Perform the signing operation
            var error: Unmanaged<CFError>?
            if let signature = SecKeyCreateSignature(
                privateKey,
                .rsaSignatureMessagePKCS1v15SHA256,
                dataToSign as CFData,
                &error
            ) {
                let signatureData = signature as Data
                let signatureString = signatureData.base64EncodedString()
                return signatureString
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    
}
