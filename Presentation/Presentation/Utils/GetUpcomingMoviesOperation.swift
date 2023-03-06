//
//  UpcomingMovieOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 16/11/22.
//

import UIKit

class GetUpcomingMoviesOperation: Operation {

  private let upcomingMovies: Void?
  
  //2
  init(_ upcomingMovies: Void?) {
    self.upcomingMovies = upcomingMovies
  }
  
  //3
  override func main() {
    //4
    if isCancelled {
      return
    }

    //5
    upcomingMovies
    
    //6
    if isCancelled {
      return
    }
    
  }
}

