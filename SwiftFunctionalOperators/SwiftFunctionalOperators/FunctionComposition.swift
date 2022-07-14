//
//  FunctionComposition.swift
//  SwiftFunctionalOperators
//
//  Created by Fernando Luiz Goulart on 13/07/22.
//

import Foundation

infix operator >>>: ForwardComposition

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication, EffectfulComposition
}

func >>> <A,B,C>(f: @escaping (A)->B, g: @escaping (B)->C) -> ((A)-> C) {
    return { a in
        g(f(a))
    }
}
