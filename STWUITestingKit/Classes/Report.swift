//
//  STWReports.swift
//  UITesting
//
//  Created by Tal Zion on 01/05/2017.
//  Copyright © 2017 Stanwood GmbH. All rights reserved.
//

import Foundation

extension UITesting {
    
    class Report {
        
        fileprivate var failures:[Failure] = []
        
        let bundleIdentifier: String
        
        init(bundleId: String) {
            bundleIdentifier = bundleId
        }
        
        /// Checking if tests did pass
        var didPass: Bool {
            return failures.count == 0
        }
        
        // MARK: - Printing the STWReport
        var review: String {
            
            get {
                guard !didPass else { return "Test passed!" }
                var print = "\nFailed Test Cases report\n\nNumber of failed tests: \(failures.count)\n\n"
                
                failures.forEach({
                    
                    if let id = $0.testID {
                        print += "\nTest ID: \(id)"
                    }
                    
                    if let navigationId = $0.navigationID {
                        print += "\nItem ID: \(navigationId),"
                    }
                    
                    print += "\nError Message: \($0.errorMessage).\n\n"
                })
                return print
            }
        }
        
        // MARK: - Adding test failiures
        func test(failed item: Failure) {
            failures.append(item)
        }
    }
}
