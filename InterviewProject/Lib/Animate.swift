//
//  Animate.swift
//  InterviewProject
//
//  Created by Matt Smith on 2/20/24.
//

import Foundation
import ImageIO

final class Animate {
    typealias CGImageFromData = (CGImage) -> Void

    private var stop: Bool
    let data: Data?

    init(data: Data?) {
        self.data = data
        self.stop = false
    }

    func image(handler: @escaping CGImageFromData) -> Bool {
        guard let data = data else { return false }

        let status = CGAnimateImageDataWithBlock(data as CFData, nil) { [weak self] (_, image, stopGIF) in
            guard let strongSelf = self else { return }
            handler(image)
            stopGIF.pointee = strongSelf.stop
        }

        return status == noErr
    }
}
