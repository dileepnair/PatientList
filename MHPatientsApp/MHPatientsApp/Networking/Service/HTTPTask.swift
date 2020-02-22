//
//  HTTPTask.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import Foundation

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
