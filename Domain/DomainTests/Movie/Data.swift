//
//  Data.swift
//  DomainTests
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 25/11/22.
//

import Foundation
import Domain

let moviesInApi: [Movie] =
[
    Movie(adult: false, backdrop_path: "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg", genre_ids: [16, 878, 28], id: 610150, original_language: "ja", original_title: "ドラゴンボール超 スーパーヒーロー", overview: "The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family.", popularity: 203, poster_path: "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg", release_date: "2022-08-18", title: "Dragon Ball Super: Super Hero", video: false, vote_average: 8, vote_count: 2028),
    
    Movie(adult: true, backdrop_path: "/7ABsaBkO1jA2psC8Hy4IDhkID4h.jpg", genre_ids: [12,2,4], id: 19995, original_language: "en", original_title: "Avatar", overview: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.", popularity: 572.998, poster_path: "/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg", release_date: "2009-12-17", title: "Avatar", video: false, vote_average: 7.5, vote_count: 26560),
    
    Movie(adult: false, backdrop_path: "/2k9tBql5GYH328Krj66tDT9LtFZ.jpg", genre_ids: [53, 12, 27], id: 760741, original_language: "en", original_title: "Beast", overview: "A recently widowed man and his two teenage daughters travel to a game reserve in South Africa. However, their journey of healing soon turns into a fight for survival when a bloodthirsty lion starts to stalk them.", popularity: 530.6, poster_path: "/xIGr7UHsKf0URWmyyd5qFMAq4d8.jpg", release_date: "2022-08-11", title: "Beast", video: false, vote_average: 7, vote_count: 799),
    
    Movie(adult: false, backdrop_path: "/geYUecpFI2AonDLhjyK9zoVFcMv.jpg", genre_ids: [12,2,4], id: 810693, original_language: "ja", original_title: "劇場版 呪術廻戦 0", overview: "Yuta Okkotsu is a nervous high school student who is suffering from a serious problem—his childhood friend Rika has turned into a curse and won't leave him alone. Since Rika is no ordinary curse, his plight is noticed by Satoru Gojo, a teacher at Jujutsu High, a school where fledgling exorcists learn how to combat curses. Gojo convinces Yuta to enroll, but can he learn enough in time to confront the curse that haunts him?", popularity: 465.414, poster_path: "/yzkgx79vj1KsZBzxFBIsQBwBkPE.jpg", release_date: "2022-03-24", title: "Jujutsu Kaisen 0", video: false, vote_average: 8.3, vote_count: 665),
    
    Movie(adult: false, backdrop_path: "/b0PlSFdDwbyK0cf5RxwDpaOJQvQ.jpg", genre_ids: [80,9648,53], id: 414906, original_language: "en", original_title: "The Batman", overview: "In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.", popularity: 437.068, poster_path: "/74xTEgt7R36Fpooo50r9T25onhq.jpg", release_date: "2022-03-03", title: "The Batman", video: false, vote_average: 7.7, vote_count: 6759),
    
    Movie(adult: false, backdrop_path: "/pwEilCqu0rYNNWjEmrxdWpAEM4x.jpg", genre_ids: [53], id: 834734, original_language: "es", original_title: "Sicosexual", overview: "After finding her boyfriend cheating on her, a woman becomes obsessed with a YouTuber to the point that she thinks he's the perfect man for her.", popularity: 344.227, poster_path: "/g5cEKhHn2NSH18FxASF8UT0LfsC.jpg", release_date: "2022-05-12", title: "Psychosexual", video: false, vote_average: 2, vote_count: 1),
    
    Movie(adult: false, backdrop_path: "", genre_ids: [12,2,4], id: 338958, original_language: "en", original_title: "Disenchanted", overview: "Disillusioned with life in the city, feeling out of place in suburbia, and frustrated that her happily ever after hasn’t been so easy to find, Giselle turns to the magic of Andalasia for help. Accidentally transforming the entire town into a real-life fairy tale and placing her family’s future happiness in jeopardy, she must race against time to reverse the spell and determine what happily ever after truly means to her and her family.", popularity: 289.747, poster_path: "/4x3pt6hoLblBeHebUa4OyiVXFiM.jpg", release_date: "2022-11-18", title: "Disenchanted", video: false, vote_average: 7.8, vote_count: 32),
    
]


let moviesInLocalStore: [Movie] =
[
    Movie(adult: false, backdrop_path: "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg", genre_ids: [16, 878, 28], id: 610150, original_language: "ja", original_title: "ドラゴンボール超 スーパーヒーロー", overview: "The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family.", popularity: 203, poster_path: "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg", release_date: "2022-08-18", title: "Dragon Ball Super: Super Hero 2", video: false, vote_average: 8, vote_count: 2028),
    
    Movie(adult: true, backdrop_path: "/7ABsaBkO1jA2psC8Hy4IDhkID4h.jpg", genre_ids: [12,2,4], id: 19995, original_language: "en", original_title: "Avatar", overview: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.", popularity: 572.998, poster_path: "/jRXYjXNq0Cs2TcJjLkki24MLp7u.jpg", release_date: "2009-12-17", title: "Avatar", video: false, vote_average: 7.5, vote_count: 26560),

    
]
