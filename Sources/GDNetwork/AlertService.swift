//
//  AlertService.swift
//  
//
//  Created by Senior Developer on 10.09.2022.
//
import UIKit

final class AlertService {
    
    static let shared = AlertService()
    
    private var title   = ""
    private var message = ""
    private var actions = [UIAlertAction]()
    
    private var alert: UIAlertController {
        get {
            let alert = UIAlertController(title  : AlertService.shared.title,
                                          message: AlertService.shared.message,
                                          preferredStyle: .alert)
            AlertService.shared.actions.forEach { action in
                alert.addAction(action)
            }
            
            return alert
        }
    }
    
    private var loaderWindow: UIWindow = {
        $0.rootViewController = UIViewController()
        $0.windowLevel = .normal + 1
        $0.makeKeyAndVisible()
        return $0
    }(UIWindow(windowScene: UIApplication.shared.windows.first!.windowScene!))
    
    public let buttonOptions = AlertButtonOptions()
    
    //MARK: - Default
    public func `default`(title: Texts.Title, message: Texts.Message, completion: @escaping ClosureEmpty = {}){
        self.title   = title.getTextFor(title: title)
        self.message = message.getTextFor(message: message)
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] (alert) in
            guard let self = self else { return }
            self.loaderWindow.isHidden = true
            completion()
        }))
        self.loaderWindow.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            self.loaderWindow.rootViewController?.present(self.alert, animated: true)
        }
        
    }
    //MARK: -  Worning
    public func warning(title: Texts.Title, message: Texts.Message){
        self.title   = title.getTextFor(title: title)
        self.message = message.getTextFor(message: message)
        loaderWindow.rootViewController?.present(alert, animated: true)
    }
    //MARK: - Text field
    public func field(title: Texts.Title, message: Texts.Message, completion: @escaping Closure<String?>){
        self.title   = title.getTextFor(title: title)
        self.message = message.getTextFor(message: message)
        alert.addTextField(configurationHandler: nil)
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: {[weak self] (alert) in
            guard let self = self else { return }
            //completion(Alert.alert.textFields?.first?.text)
            self.loaderWindow.isHidden = true
        }))
        self.loaderWindow.isHidden = false
        loaderWindow.rootViewController?.present(alert, animated: true)
    }
    //MARK: -  CustomText
    public func customText(title: Texts.Title, message: Texts.MessageCustom, completion: @escaping ClosureEmpty = {}){
        var messageCustom = ""
        switch message {
            case .message(let text):
                messageCustom = text
        }
        self.title   = title.getTextFor(title: title)
        self.message = messageCustom
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: {[weak self] (alert) in
            guard let self = self else { return }
            self.loaderWindow.isHidden = true
            completion()
            
        }))
        self.loaderWindow.isHidden = false
        loaderWindow.rootViewController?.present(alert, animated: true)
    }
    //MARK: - Options
    public func options(title: Texts.Title, message: Texts.Message, options: AlertButtonOptions.Types, completion: @escaping Closure<Int>){
        self.title   = title.getTextFor(title: title)
        self.message = message.getTextFor(message: message)
        self.actions.removeAll()
        let options: AlertButtonOptionsoble = buttonOptions.change(type: options)
        for button in 0..<options.buttonsCount {
            let action = UIAlertAction(title: options.buttonsText[button], style: .default, handler: {[weak self] (alert) in
                guard let self = self else { return }
                self.loaderWindow.isHidden = true
                completion(button)
            })
            self.actions.append(action)
        }
        self.loaderWindow.isHidden = false
        loaderWindow.rootViewController?.present(alert, animated: true)
    }
    init(){}
}


