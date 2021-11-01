//
//  ViewController.swift
//  Lesson_29
//
//  Created by Evgeniy Nosko on 1.11.21.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var label: UILabel!
    
//    создали объект KeyChain
    private let keyChain = KeychainSwift()
//    создаем ключ
    private let keyChainKey = "keyChainKey"
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        проверка на сохранение текста
        getTextFromKeyChain()
//        Удаление значение из keyChain (удаление ключа)
//        keyChain.delete(keyChainKey)
    }
    
    @IBAction private func buttonPressed() {
        saveTextToKeyChain()
        getTextFromKeyChain()
    }
    
    private func saveTextToKeyChain() {
        guard let text = textField.text else { return }
        keyChain.set(text, forKey: keyChainKey, withAccess: nil)
    }
    
    private func getTextFromKeyChain() {
        guard let text = keyChain.get(keyChainKey) else { return }
        label.text = text
    }


}

