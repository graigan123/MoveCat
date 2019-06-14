//
//  StatefulControllerImplementation.swift
//  SysZone
//
//  Created by tmp_user on 28/12/18.
//  Copyright © 2018 tmp_user. All rights reserved.
//

import UIKit

public protocol StatefulPlaceholderView {
    func placeholderViewInsets() -> UIEdgeInsets
}

extension StatefulPlaceholderView {
    public func placeholderViewInsets() -> UIEdgeInsets {
        return UIEdgeInsets()
    }
}

public enum StatefulViewControllerState: String {
    case content = "content"
    case loading = "loading"
    case error = "error"
    case empty = "empty"
}

public protocol BackingViewProvider {
    var backingView: UIView { get }
}

public protocol StatefulViewControllerDelegate: class, BackingViewProvider {
    
    var stateMachine: ViewStateMachine { get }
    var currentState: StatefulViewControllerState { get }
    var lastState: StatefulViewControllerState { get }
    
    
    // MARK: Views
    var loadingView: UIView? { get set }
    var errorView: UIView? { get set }
    var emptyView: UIView? { get set }
    
    
    // MARK: Transitions
    func setupInitialViewState(frame: CGRect, completion: (() -> Void)?, topOffset: CGFloat, emptyMessage: String?)
    func startLoading(animated: Bool, completion: (() -> Void)?)
    func endLoading(animated: Bool, error: Error?, completion: (() -> Void)?)
    func transitionViewStates(loading: Bool, error: Error?, animated: Bool, completion: (() -> Void)?)
    
    
    // MARK: Content and error handling
    func hasContent() -> Bool
    func success(_ type: ResponseType)
    func failure(_ type: ResponseType, error: Error)
}


// MARK: Default Implementation BackingViewProvider
extension BackingViewProvider where Self: UIViewController {
    public var backingView: UIView {
        return view
    }
}

extension BackingViewProvider where Self: UIView {
    public var backingView: UIView {
        return self
    }
}
// MARK: Default Implementation StatefulViewController

extension StatefulViewControllerDelegate {
    
    public var stateMachine: ViewStateMachine {
        return associatedObject(self, key: &stateMachineKey) { [unowned self] in
            return ViewStateMachine(view: self.backingView)
        }
    }
    
    public var currentState: StatefulViewControllerState {
        switch stateMachine.currentState {
        case .none: return .content
        case .view(let viewKey): return StatefulViewControllerState(rawValue: viewKey)!
        }
    }
    
    public var lastState: StatefulViewControllerState {
        switch stateMachine.lastState {
        case .none: return .content
        case .view(let viewKey): return StatefulViewControllerState(rawValue: viewKey)!
        }
    }
    
    
    // MARK: Views
    
    public var loadingView: UIView? {
        get { return placeholderView(.loading) }
        set { setPlaceholderView(newValue, forState: .loading) }
    }
    
    public var errorView: UIView? {
        get { return placeholderView(.error) }
        set { setPlaceholderView(newValue, forState: .error) }
    }
    
    public var emptyView: UIView? {
        get { return placeholderView(.empty) }
        set { setPlaceholderView(newValue, forState: .empty) }
    }
    
    
    // MARK: Transitions
    public func setupViews(frame: CGRect, topOffset: CGFloat, emptyMessage: String? = "no Content") {
        
        loadingView = LoadingView(frame: frame, topOffset: topOffset)
        emptyView = EmptyView(frame: frame, topOffset: topOffset, emptyMessage: emptyMessage)
        errorView = ErrorView(frame: frame, topOffset: topOffset)
    }
    
    public func setupInitialViewState(frame: CGRect, completion: (() -> Void)? = nil, topOffset: CGFloat, emptyMessage: String? = "no Content") {
        
        self.setupViews(frame: frame, topOffset: topOffset, emptyMessage: emptyMessage)
        
        let isLoading = (lastState == .loading)
        let error: NSError? = (lastState == .error) ? NSError(domain: "com.aschuch.StatefulViewController.ErrorDomain", code: -1, userInfo: nil) : nil
        transitionViewStates(loading: isLoading, error: error, animated: false, completion: completion)
    }
    
    public func startLoading(animated: Bool = false, completion: (() -> Void)? = nil) {
        transitionViewStates(loading: true, animated: animated, completion: completion)
    }
    
    public func endLoading(animated: Bool = true, error: Error? = nil, completion: (() -> Void)? = nil) {
        transitionViewStates(loading: false, error: error, animated: animated, completion: completion)
        
        transitionViewStates(loading: true, animated: animated, completion: completion)
    }
    
    public func transitionViewStates(loading: Bool = false, error: Error? = nil, animated: Bool = true, completion: (() -> Void)? = nil) {
        if hasContent() {
            self.stateMachine.transitionToState(.none, animated: animated, completion: completion)
            return
        }
        var newState: StatefulViewControllerState = .empty
        if loading {
            newState = .loading
        } else if let _ = error {
            newState = .error
        }
        
//                if .empty == lastState {
//                    return
//                }
        self.stateMachine.transitionToState(.view(newState.rawValue), animated: animated, completion: completion)
    }
    
    // MARK: Content and error handling
    
    // MARK: Helper
    
    fileprivate func placeholderView(_ state: StatefulViewControllerState) -> UIView? {
        return stateMachine[state.rawValue]
    }
    
    fileprivate func setPlaceholderView(_ view: UIView?, forState state: StatefulViewControllerState) {
        stateMachine[state.rawValue] = view
    }
}

// MARK: Association

private var stateMachineKey: UInt8 = 0

private func associatedObject<T: AnyObject>(_ host: AnyObject, key: UnsafeRawPointer, initial: () -> T) -> T {
    var value = objc_getAssociatedObject(host, key) as? T
    if value == nil {
        value = initial()
        objc_setAssociatedObject(host, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
    return value!
}

