//
//  PipeForwardOperator.swift
//  SwiftFunctionalOperators
//
//  Created by Fernando Luiz Goulart on 13/07/22.
//

import Foundation

precedencegroup ForwardApplication {
    associativity: left
}
infix operator |>: ForwardApplication

func |> <A,B>(a: A, f: (A)->B) -> B {
    return f(a)
}

func |> <A>(a: inout A, f: (inout A) -> Void) -> Void {
  f(&a)
}
