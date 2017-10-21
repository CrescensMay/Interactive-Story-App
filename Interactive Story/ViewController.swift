//
//  ViewController.swift
//  Interactive Story
//
//  Created by Mac on 18/10/2017.
//  Copyright © 2017 Smart Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            
            do {
                if let name = nameTextField.text {
                    if name == "" {
                        throw AdventureError.nameNotProvided
                    }else {
                        guard let pageController = segue.destination as? PageController else {
                            return
                        }
                        pageController.page = Adventure.story(withName: name)
                    }
                }
            }catch AdventureError.nameNotProvided {
                
                let alertController = UIAlertController(title: "Name not Provided", message: "Provide a name to start the story", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            }catch let error {
                fatalError("\(error.localizedDescription)")
            }
        }
    }
    
    func keyboardWillShow(_ notification: Notification){
        print("Keyboard will show")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


}

