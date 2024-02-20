//
//  DownloadManager.swift
//  InterviewProject
//
//  Created by Matt Smith on 1/20/21.
//

import Combine
import Foundation

struct GIFModel {
    let title: String
    let url: String

    init(title: String? = nil, url: String? = nil) {
        self.title = title ?? ""
        self.url = url ?? ""
    }
}
