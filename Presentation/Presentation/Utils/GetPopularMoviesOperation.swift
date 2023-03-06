//
//  GetPopularMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import Foundation


class GetPopularMoviesOperation: Operation {
    private let popularMovies: Void?
    
    //2
    init(_ popularMovies: Void?) {
        self.popularMovies = popularMovies
    }
    
    //3
    override func main() {
        //4
        if isCancelled {
            return
        }
        
        //5
        popularMovies
        
        //6
        if isCancelled {
            return
        }
        
    }
}
