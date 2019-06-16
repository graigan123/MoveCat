//
//  BaseService.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import SwiftyJSON
import Alamofire

//TODO passar as mensagens de erro para Localizable.strings

enum APIError {
    //    case noInternet, serverError, notAuthorized, canceled, notFound, httpError(string: String), other
    case noInternet, serverError, notAuthorized, notFound, httpError(string: String), other
    
    var description: String {
        switch self {
        case .noInternet: return "Verifique a sua conexão com a internet."
        case .serverError: return "Erro interno de servidor."
        case .notAuthorized: return "Erro na autorização."
        //            case .canceled: return "Request cancelado."
        case .notFound: return "Não encontrado."
        case .httpError(let mensagem): return mensagem.isEmpty ? "Deu um erro aqui, já vamos arrumá." : mensagem
        case .other: return "Aguarde carregamento..."
        }
    }
}

class BaseService {
    
    private func getErrorType(statusCode: Int, data: Data?)-> APIError {
        
        switch statusCode {
        case 500...599:
            return APIError.serverError
        case 401:
            return APIError.notAuthorized
        case 400:
            return APIError.httpError(string: "Existe algum campo vazio")
        case 404:
            return APIError.notFound
            //case 400,403:
            //    return data != nil ? APIError.httpError(string: JSON(data: data!)["message"].stringValue) : APIError.other
            //        case -999:
        //            return APIError.canceled
        case -1009:
            return APIError.noInternet
        default:
            return APIError.other
        }
    }
    
    private func getStatusCode<T: Any>(response: DataResponse<T>) -> Int {
        
        var statusCode = 0
        if let httpResponse = response.response {
            statusCode = httpResponse.statusCode
        } else {
            if let urlError = response.result.error as? URLError {
                statusCode = urlError.errorCode
            }
        }
        return statusCode
    }
    
    func getError<T: Any>(response: DataResponse<T>) -> Error {
        let statusCode = self.getStatusCode(response: response)
        let errorType = self.getErrorType(statusCode: statusCode, data: response.data)
        return NSError(domain: baseURL, code: statusCode, userInfo: ["type":errorType])
    }
}
