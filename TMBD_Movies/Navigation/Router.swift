//
//  Router.swift
//  TMBD_Movies
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import SwiftUI
import Combine

public class AnyIdentifable: Identifiable {
    public let destination: any Identifiable
    
    public init(destination: any Identifiable) {
        self.destination = destination
    }
}

public final class Router<T: Hashable>: ObservableObject {
    
    @Published public var navPath = NavigationPath()
    @Published public var presentedSheet: AnyIdentifable?
    
    public init() { }
    
    public func presentSheet(_ destination: AnyIdentifable) {
        presentedSheet = AnyIdentifable(destination: destination)
    }
    
    public func navigate(to destination: T) {
        navPath.append(destination)
    }
    
    public func navigateBack() {
        navPath.removeLast()
    }
    
    public func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
