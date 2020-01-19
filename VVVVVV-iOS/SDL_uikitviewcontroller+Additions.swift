//
//  SDL2ViewController+Additions.swift
//  Quake2-iOS
//
//  Created by Tom Kidd on 1/28/19.
//

import UIKit

extension SDL_uikitviewcontroller {
    
    // A method of getting around the fact that Swift extensions cannot have stored properties
    // https://medium.com/@valv0/computed-properties-and-extensions-a-pure-swift-approach-64733768112c
    struct Holder {
        static var _actionButton = UIButton()
        static var _joystickView = JoyStickView(frame: .zero)
        static var _escapeButton = UIButton()
        static var _enterButton = UIButton()
    }
    
    var actionButton:UIButton {
        get {
            return Holder._actionButton
        }
        set(newValue) {
            Holder._actionButton = newValue
        }
    }
    
    var joystickView:JoyStickView {
        get {
            return Holder._joystickView
        }
        set(newValue) {
            Holder._joystickView = newValue
        }
    }
    
    var escapeButton:UIButton {
        get {
            return Holder._escapeButton
        }
        set(newValue) {
            Holder._escapeButton = newValue
        }
    }

    var enterButton:UIButton {
        get {
            return Holder._enterButton
        }
        set(newValue) {
            Holder._enterButton = newValue
        }
    }

    @objc func actionButton(rect: CGRect) -> UIButton {
        actionButton = UIButton(frame: CGRect(x: rect.width - 90, y: rect.height - 135, width: 75, height: 75))
        actionButton.setTitle("ACTION", for: .normal)
//        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        actionButton.setBackgroundImage(UIImage(named: "JoyStickBase")!, for: .normal)
        actionButton.addTarget(self, action: #selector(self.actionPressed), for: .touchDown)
        actionButton.addTarget(self, action: #selector(self.actionReleased), for: .touchUpInside)
        actionButton.alpha = 0.5
        return actionButton
    }
    
    @objc func escapeButton(rect: CGRect) -> UIButton {
        escapeButton = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 30))
        escapeButton.setTitle(" ESC ", for: .normal)
        escapeButton.addTarget(self, action: #selector(self.escapePressed), for: .touchDown)
        escapeButton.addTarget(self, action: #selector(self.escapeReleased), for: .touchUpInside)
        escapeButton.layer.borderColor = UIColor.white.cgColor
        escapeButton.layer.borderWidth = CGFloat(1)
        escapeButton.alpha = 0.5
        return escapeButton
    }
    
    @objc func enterButton(rect: CGRect) -> UIButton {
        enterButton = UIButton(frame: CGRect(x: rect.width - 70, y: 10, width: 60, height: 30))
        enterButton.setTitle(" MENU ", for: .normal)
        enterButton.addTarget(self, action: #selector(self.enterPressed), for: .touchDown)
        enterButton.addTarget(self, action: #selector(self.enterReleased), for: .touchUpInside)
        enterButton.layer.borderColor = UIColor.white.cgColor
        enterButton.layer.borderWidth = CGFloat(1)
        enterButton.alpha = 0.5
        return enterButton
    }
    
    @objc func joyStick(rect: CGRect) -> JoyStickView {
        let size = CGSize(width: 100.0, height: 100.0)
        let joystick1Frame = CGRect(origin: CGPoint(x: 50.0,
                                                    y: (rect.height - size.height - 50.0)),
                                    size: size)
        joystickView = JoyStickView(frame: joystick1Frame)
        joystickView.delegate = self
        
        joystickView.movable = false
        joystickView.alpha = 0.5
        joystickView.baseAlpha = 0.5 // let the background bleed thru the base
        joystickView.handleTintColor = UIColor.darkGray // Colorize the handle
        return joystickView
    }
    
    @objc func actionPressed(sender: UIButton!) {
        Key_Event(key: SDLK_z, pressed: true)
    }
    
    @objc func actionReleased(sender: UIButton!) {
        Key_Event(key: SDLK_z, pressed: false)
    }
    
    @objc func escapePressed(sender: UIButton!) {
        Key_Event(key: SDLK_ESCAPE, pressed: true)
    }
    
    @objc func escapeReleased(sender: UIButton!) {
        Key_Event(key: SDLK_ESCAPE, pressed: false)
    }
        
    @objc func enterPressed(sender: UIButton!) {
        Key_Event(key: SDLK_RETURN, pressed: true)
    }
    
    @objc func enterReleased(sender: UIButton!) {
        Key_Event(key: SDLK_RETURN, pressed: false)
    }
        
    func Key_Event(key: Int, pressed: Bool) {
        var event = SDL_Event()
        event.type = pressed ? SDL_KEYDOWN.rawValue : SDL_KEYUP.rawValue
        event.key.keysym.sym = SDL_Keycode(key)
        event.key.state = Uint8(pressed ? SDL_PRESSED : SDL_RELEASED)
        SDL_PushEvent(&event)
    }

    @objc func toggleControls(_ hide: Bool) {
        self.actionButton.isHidden = hide
        self.joystickView.isHidden = hide
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension SDL_uikitviewcontroller: JoystickDelegate {
    
    func handleJoyStickPosition(x: CGFloat, y: CGFloat) {
        
//        if y > 0.25 {
//            Key_Event(key: SDLK_w, pressed: true)
//        } else if y < -0.25 {
//            Key_Event(key: SDLK_s, pressed: true)
//        } else {
//            Key_Event(key: SDLK_w, pressed: false)
//            Key_Event(key: SDLK_s, pressed: false)
//        }
        
        if x > 0.25 {
            Key_Event(key: SDLK_d, pressed: true)
        } else if x < -0.25 {
            Key_Event(key: SDLK_a, pressed: true)
        } else {
            Key_Event(key: SDLK_d, pressed: false)
            Key_Event(key: SDLK_a, pressed: false)
        }
        
    }
    
    func handleJoyStick(angle: CGFloat, displacement: CGFloat) {
//        print("angle: \(angle) displacement: \(displacement)")
    }
    
}
