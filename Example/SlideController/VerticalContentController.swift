//
//  VerticalContentController.swift
//  SlideController_Example
//
//  Created by Pavel Kondrashkov on 10/17/17.
//  Copyright © 2017 Touchlane LLC. All rights reserved.
//

import UIKit

protocol VerticalContentControllerActionable {
    typealias Action = () -> Void
    
    var removeDidTapAction: Action? { get set }
    var insertDidTapAction: Action? { get set }
    var menuDidTapAction: Action? { get set }
}

class VerticalContentController: VerticalContentControllerActionable {
    private let internalView = VerticalContentView()
    
    var removeDidTapAction: Action? {
        didSet {
            internalView.removeButton.didTouchUpInside = removeDidTapAction
        }
    }
    
    var insertDidTapAction: Action? {
        didSet {
            internalView.insertButton.didTouchUpInside = insertDidTapAction
        }
    }
    
    var menuDidTapAction: Action? {
        didSet {
            internalView.menuButton.didTouchUpInside = menuDidTapAction
        }
    }
}

private typealias ViewableImplementation = VerticalContentController
extension ViewableImplementation: ViewAccessible {
    var view: UIView {
        return internalView
    }
}
