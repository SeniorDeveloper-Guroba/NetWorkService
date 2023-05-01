//
//  Texts.swift
//  
//
//  Created by Senior Developer on 10.09.2022.
//
import Foundation

final public class Texts {
    
    public enum Title: String, CaseIterable {
        
        case empty        = ""
        case error        = "ОШИБКА"
        case noNetwork    = "НЕТ ИНТЕРНЕТА"
        
        private func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        
        public func getTextFor(title: Title?) -> String {
            return title!.localizedString()
        }
    }
    
    public enum Message: String, CaseIterable {
        
        case empty     = ""
        case noNetwork = "Отсутствует подключение к сети, подключите Ваше устройство и попробуйте снова"
        case noJSON    = "Извините произошла ошибка получения данных"
        
        private func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        
        public func getTextFor(message: Message?) -> String {
            return message!.localizedString()
        }
    }
    
    public enum MessageCustom {
        case message(String)
    }
    
    public enum Warning {
        case non
    }
    
    public enum Project: String {
        
        case empty
        
        private func localizedString() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
        public func getTextFor(_ text: Project?) -> String {
            return text!.localizedString()
        }
    }
    
    static func text(_ text: Project) -> String {
        return text.rawValue
    }
}


