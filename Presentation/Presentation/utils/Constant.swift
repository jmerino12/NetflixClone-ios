//
//  Constant.swift
//  NetflixClone
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 10/10/22.
//

import UIKit


let movies: [Movie] = Bundle.main.decode("data.json")
let trendingMovies: [Movie] = Array(movies[1...8])
let moviesUpComing: [Movie] = Array(movies[9...18])
let popularMovies: [Movie] = Array(movies[19...28])
let topRate: [Movie] = Array(movies[29...])
