//
//  Common+Utils.swift
//  TestPod01
//
//  Created by Sumetha on 5/7/22.
//

import Foundation

public func guaranteeMainThread(_ action : @escaping () -> () ) {
    if Thread.current.isMainThread {
        action()
    } else {
        DispatchQueue.main.async(execute: action)
    }
}
