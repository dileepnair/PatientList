//
//  PatientsAPI.swift
//  MHPatientsApp
//
//  Created by Dileep Sanker on 8/28/19.
//  Copyright © 2019 Dileep Sanker. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum PatientsAPI {
    case patientList
}

extension PatientsAPI: EndPointType {
    var headers: HTTPHeaders? {
        return nil
    }
    
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production,.qa,.staging: return "https://my-json-server.typicode.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
            return "brianmckee/clinical/patients"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
   
}

