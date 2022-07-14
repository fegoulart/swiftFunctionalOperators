//
//  FishOperator.swift
//  SwiftFunctionalOperators
//
//  Created by Fernando Luiz Goulart on 13/07/22.
//

import Foundation
import Combine

precedencegroup EffectfulComposition {
    associativity: left
    higherThan: ForwardApplication
    //lowerThan: ForwardComposition
}

infix operator >=>: EffectfulComposition

func >=> <A, B, C>(
    _ f: @escaping (A)->(B, [String]),
    _ g: @escaping (B) -> (C, [String])
) -> (A) -> (C, [String]) {
    return { a in
        let (b, logs) = f(a)
        let (c, moreLogs) = g(b)
        return (c, logs + moreLogs)
    }
}

func >=> <A, B, C>(
    _ f: @escaping (A)-> B?,
    _ g: @escaping (B) -> C?
) -> (A) -> C? {
    return { a in
        guard let b = f(a) else { return nil}
        let c = g(b)
        return c
    }
}

func >=> <A, B, C>(
    _ f: @escaping (A)-> [B],
    _ g: @escaping (B) -> [C]
) -> ((A) -> [C]) {
    return { a in
        let b = f(a)
        var c: [C] = []
        for myB in b {
            c.append(contentsOf: g(myB))
        }
        return c
    }
}

//func >=> <A, B, C>(
//    _ f: @escaping (A) -> Future.Promise<B>,
//    _ g: @escaping (B) -> Future.Promise<C>
//) -> ((A) -> Future.Promise<C>) {
//    return { a in
//
//    }
//}
