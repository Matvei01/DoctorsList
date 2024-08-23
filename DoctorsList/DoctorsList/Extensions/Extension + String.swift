//
//  Extension + String.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 20.08.2024.
//

import Foundation

extension String {
    struct TabItemImage {
        static func homeSelected() -> String {
            return "homeSelected"
        }
        
        static func homeDefault() -> String {
            return "homeDefault"
        }
        
        static func appointmentsSelected() -> String {
            return "appointmentsSelected"
        }
        
        static func appointmentsDefault() -> String {
            return "appointmentsDefault"
        }
        
        static func chatSelected() -> String {
            return "chatSelected"
        }
        
        static func chatDefault() -> String {
            return "chatDefault"
        }
        
        static func profileSelected() -> String {
            return "profileSelected"
        }
        
        static func profileDefault() -> String {
            return "profileDefault"
        }
    }
    
    struct LikeImage {
        static func heartSelected() -> String {
            return "heartSelected"
        }
        
        static func heartDefault() -> String {
            return "heartDefault"
        }
    }
    
    struct InfoImage {
        static func experience() -> String {
            return "experience"
        }
        
        static func doctorate() -> String {
            return "doctorate"
        }
        
        static func education() -> String {
            return "education"
        }
        
        static func location() -> String {
            return "location"
        }
    }
}


