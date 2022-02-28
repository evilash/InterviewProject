//
//  Accessibility.swift
//  InterviewProject
//
//  Created by Matt Smith on 2/27/22.
//

import Foundation

struct Accessibility {
    static func id(for name: String) -> String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}
