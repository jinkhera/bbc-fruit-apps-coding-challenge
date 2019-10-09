//
//  Application.swift
//  BBC Fruits AppTests
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

struct Application {
    
}

extension Application {
    enum AppConfiguration: Int {
        case Debug
        case TestFlight
        case AppStore
    }
    
    struct Configuration {
        
        private static let isTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
        
        static var isDebug: Bool {
            #if DEBUG
                return true
            #else
                return false
            #endif
        }
        
        static var appConfiguration: AppConfiguration {
            if isDebug {
                return .Debug
            } else if isTestFlight {
                return .TestFlight
            } else {
                return .AppStore
            }
        }
        
        static func baseURL(path: String) -> String {
            switch (Configuration.appConfiguration) {
            case .Debug:
                return "https://raw.githubusercontent.com/bbc/news-apps-coding-challenge/master/\(path)"
            default:
                return "https://raw.githubusercontent.com/bbc/news-apps-coding-challenge/master/\(path)"
            }
        }
        
        static var BuildVersion: String {
            return "\(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")!) (\(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")!))"
        }
        
        static var BundleName: String {
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        }
        
        static var info: String {
            if isDebug {
                return "Debug version \(BuildVersion)"
            } else if isTestFlight {
                return "TestFlight version \(BuildVersion)"
            } else {
                return "App store version \(BuildVersion)"
            }
        }
        
        struct KeychainKeys {
            static var authTokenKey = "FuzzyWuzzy"
        }
    }
}
