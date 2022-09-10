//
//  AlertButtonOptions.swift
//  
//
//  Created by Senior Developer on 10.09.2022.
//
import Foundation

final class AlertButtonOptions {
    
    public func change(type: AlertButtonOptions.Types) -> AlertButtonOptionsoble {
        
        switch type {
            case .InstallTG:
                return AlertButtonTG()
            case .TwoResponse:
                return TwoResponse()
            case .Cancel:
                return AlertButtonCancel()
            case .AddPhoto:
                return AddPhoto()
            case .CameraAccess:
                return CameraAccess()
        }
    }
    enum Types {
        case InstallTG
        case TwoResponse
        case Cancel
        case AddPhoto
        case CameraAccess
    }
}

class AlertButtonTG: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Уже установлен", "Установить из App Store", "Отмена"]
}
class TwoResponse: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Да", "Нет"]
}

class AlertButtonCancel: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Да", "Нет"]
}

class AddPhoto: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Библиотека", "Фотопарат", "Отмена"]
}

class CameraAccess: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Настройки", "Отмена"]
}
