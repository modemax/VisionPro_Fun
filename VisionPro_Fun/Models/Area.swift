//
//  Area.swift
//  VisionPro_Fun
//
//  Created by Christopher Reese on 10/9/23.
//

import Foundation

enum Area : String, Identifiable, CaseIterable, Equatable
{
    case EarthDisplay, arArea2, arArea3
    var id: Self { self }
    var name: String { rawValue }
    
    var title: String {
        switch self {
        case.EarthDisplay:
            "A view of Earth..."
        case.arArea2:
            "AR Area #2..."
        case.arArea3:
            "AR Area #3..."
        }
    }
}
