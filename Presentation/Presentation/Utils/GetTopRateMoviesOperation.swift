//
//  getTopRateMoviesOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 17/11/22.
//

import UIKit

class GetTopRateMoviesOperation: Operation {
    
    private let topRateMovies: Void?
    
    //2
    init(_ topRateMovies: Void?) {
        self.topRateMovies = topRateMovies
    }
    
    //3
    override func main() {
        //4
        if isCancelled {
            return
        }
        
        //5
        topRateMovies
        
        //6
        if isCancelled {
            return
        }
        
    }
    
}
