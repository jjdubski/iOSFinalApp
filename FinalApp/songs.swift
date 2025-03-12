//
//  songs.swift
//  FinalApp
//
//  Created by Serhat Cingilli on 3/10/25.
//

import Foundation

let songs = [
    Song(title: "Bohemian Rhapsody",
         artist: "Queen",
         album: "A Night at the Opera",
         genre: .rock,
         shortDescription: "A groundbreaking rock opera",
         longDescription: "Bohemian Rhapsody is a song by the British rock band Queen. It is known for its distinctive structure and innovative style that fused rock and opera."),
    
    Song(title: "Imagine",
         artist: "John Lennon",
         album: "Imagine",
         genre: .pop,
         shortDescription: "A call for peace",
         longDescription: "Imagine is a song by John Lennon that invites listeners to envision a world of peace and unity without borders or conflicts."),
    
    Song(title: "Billie Jean",
         artist: "Michael Jackson",
         album: "Thriller",
         genre: .pop,
         shortDescription: "A pop classic with a distinctive bassline",
         longDescription: "Billie Jean is one of Michael Jackson's most iconic tracks. It features a memorable bassline and has influenced pop music worldwide."),
    
    Song(title: "Stairway to Heaven",
         artist: "Led Zeppelin",
         album: "Led Zeppelin IV",
         genre: .rock,
         shortDescription: "An epic rock ballad",
         longDescription: "Stairway to Heaven is a classic rock anthem by Led Zeppelin that builds from a gentle acoustic melody to a powerful electric crescendo."),
    
    Song(title: "Hotel California",
         artist: "Eagles",
         album: "Hotel California",
         genre: .rock,
         shortDescription: "A haunting narrative",
         longDescription: "Hotel California is known for its evocative lyrics and memorable guitar solos, symbolizing the excesses of the Californian lifestyle."),
    
    Song(title: "Teen Spirit",
         artist: "Nirvana",
         album: "Nevermind",
         genre: .rock,
         shortDescription: "The anthem of a generation",
         longDescription: "Smells Like Teen Spirit by Nirvana defined the grunge movement with its raw sound and rebellious spirit."),
    
    Song(title: "Shape of You",
         artist: "Ed Sheeran",
         album: "Divide",
         genre: .pop,
         shortDescription: "A catchy modern pop hit",
         longDescription: "Shape of You is a chart-topping song by Ed Sheeran known for its infectious rhythm and lyrical charm."),
    
    Song(title: "Lose Yourself",
         artist: "Eminem",
         album: "8 Mile",
         genre: .hipHop,
         shortDescription: "A motivational hip-hop anthem",
         longDescription: "Lose Yourself by Eminem is renowned for its intense lyrics and powerful beat, inspiring many to pursue their dreams."),
    
    Song(title: "Rolling in the Deep",
         artist: "Adele",
         album: "21",
         genre: .pop,
         shortDescription: "A soulful pop masterpiece",
         longDescription: "Rolling in the Deep is one of Adele's breakthrough hits, known for its stirring vocals and emotional depth."),
    
    Song(title: "One Dance",
         artist: "Drake",
         album: "Views",
         genre: .hipHop,
         shortDescription: "A dancehall-infused hit",
         longDescription: "One Dance by Drake blends hip-hop with dancehall influences, creating a rhythmically engaging and globally popular track.")
]

class Song {
    
    enum Genre: String {
        case pop = "Pop"
        case rock = "Rock"
        case hipHop = "Hip Hop"
    }
    
    var title: String
    var artist: String
    var album: String
    var genre: Genre
    var shortDescription: String
    var longDescription: String
    
    init(title: String, artist: String, album: String, genre: Genre, shortDescription: String, longDescription: String) {
        self.title = title
        self.artist = artist
        self.album = album
        self.genre = genre
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
}
