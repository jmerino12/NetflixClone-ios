//
//  GetLatestMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import Foundation
import Domain
import Infraestructure

class GetLatestMoviesOperation: Operation {
    
    private let lastestMovies: Void?
    
    //2
    init(_ lastestMovies: Void?) {
        self.lastestMovies = lastestMovies
    }
    
    //3
    override func main() {
        //4
        if isCancelled {
            return
        }
        
        //5
        lastestMovies
        
        //6
        if isCancelled {
            return
        }
        
    }
}
