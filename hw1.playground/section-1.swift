// Playground - noun: a place where people can play

import UIKit

func getFib(N: UInt) -> (N: UInt, R: UInt) {
    
    switch N {
    case 0,1:
        return (N, N)
    default:
        return (N, getFib(N - 1).R + getFib(N - 2).R)
    }
    
}


println(getFib(10))