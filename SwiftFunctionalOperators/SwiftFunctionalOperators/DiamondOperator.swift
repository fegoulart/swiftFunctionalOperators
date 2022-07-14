//
//  DiamondOperator.swift
//  SwiftFunctionalOperators
//
//  Created by Fernando Luiz Goulart on 14/07/22.
//

import Foundation

precedencegroup SingleTypeComposition {
  associativity: left
  higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

func <> <A>(
  f: @escaping (A) -> A,
  g: @escaping (A) -> A)
  -> ((A) -> A) {

  return f >>> g
}

func <> <A>(
    f: @escaping (inout A) -> Void,
    g: @escaping (inout A) -> Void
) -> ((inout A) -> Void) {
    return { a in
        f(&a)
        g(&a)
    }
}
