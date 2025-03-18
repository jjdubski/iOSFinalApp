//
//  songs.swift
//  FinalApp
//
//  Created by Serhat Cingilli on 3/10/25.
//

import Foundation

class Song : Equatable {
   
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.title == rhs.title && lhs.artist == rhs.artist
    }
    
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
    var relatedSongs: [RelatedSong] = []
    
    init(title: String, artist: String, album: String, genre: Genre, shortDescription: String, longDescription: String, relatedSongs: [RelatedSong] = []) {
        self.title = title
        self.artist = artist
        self.album = album
        self.genre = genre
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.relatedSongs = relatedSongs
    }
    
    struct RelatedSong {
        var title: String
        var album: String
    }
}

let songs = [
    Song(title: "Bohemian Rhapsody",
         artist: "Queen",
         album: "A Night at the Opera",
         genre: .rock,
         shortDescription: "A groundbreaking rock opera",
         longDescription: "Bohemian Rhapsody is a song by the British rock band Queen. It is known for its distinctive structure and innovative style that fused rock and opera.",
         relatedSongs: [
            Song.RelatedSong(title: "We Will Rock You", album: "News of the World"),
            Song.RelatedSong(title: "Don't Stop Me Now", album: "Jazz"),
            Song.RelatedSong(title: "Another One Bites the Dust", album: "The Game")
         ]),
    
    Song(title: "Imagine",
         artist: "John Lennon",
         album: "Imagine",
         genre: .pop,
         shortDescription: "A call for peace",
         longDescription: "Imagine is a song by John Lennon that invites listeners to envision a world of peace and unity without borders or conflicts.",
         relatedSongs: [
            Song.RelatedSong(title: "Give Peace a Chance", album: "Live Peace in Toronto 1969"),
            Song.RelatedSong(title: "Working Class Hero", album: "John Lennon/Plastic Ono Band"),
            Song.RelatedSong(title: "Instant Karma!", album: "Single")
         ]),
    
    Song(title: "Billie Jean",
         artist: "Michael Jackson",
         album: "Thriller",
         genre: .pop,
         shortDescription: "A pop classic with a distinctive bassline",
         longDescription: "Billie Jean is one of Michael Jackson's most iconic tracks. It features a memorable bassline and has influenced pop music worldwide.",
         relatedSongs: [
            Song.RelatedSong(title: "Thriller", album: "Thriller"),
            Song.RelatedSong(title: "Beat It", album: "Thriller"),
            Song.RelatedSong(title: "Smooth Criminal", album: "Bad")
         ]),
    
    Song(title: "Stairway to Heaven",
         artist: "Led Zeppelin",
         album: "Led Zeppelin IV",
         genre: .rock,
         shortDescription: "An epic rock ballad",
         longDescription: "Stairway to Heaven is a classic rock anthem by Led Zeppelin that builds from a gentle acoustic melody to a powerful electric crescendo.",
         relatedSongs: [
            Song.RelatedSong(title: "Kashmir", album: "Physical Graffiti"),
            Song.RelatedSong(title: "Black Dog", album: "Led Zeppelin IV"),
            Song.RelatedSong(title: "Whole Lotta Love", album: "Led Zeppelin II")
         ]),
    
    Song(title: "Hotel California",
         artist: "Eagles",
         album: "Hotel California",
         genre: .rock,
         shortDescription: "A haunting narrative",
         longDescription: "Hotel California is known for its evocative lyrics and memorable guitar solos, symbolizing the excesses of the Californian lifestyle.",
         relatedSongs: [
            Song.RelatedSong(title: "Take It Easy", album: "Eagles"),
            Song.RelatedSong(title: "Desperado", album: "Desperado"),
            Song.RelatedSong(title: "Life in the Fast Lane", album: "Hotel California")
         ]),
    
    Song(title: "Smells Like Teen Spirit",
         artist: "Nirvana",
         album: "Nevermind",
         genre: .rock,
         shortDescription: "The anthem of a generation",
         longDescription: "Smells Like Teen Spirit by Nirvana defined the grunge movement with its raw sound and rebellious spirit.",
         relatedSongs: [
            Song.RelatedSong(title: "Come As You Are", album: "Nevermind"),
            Song.RelatedSong(title: "Lithium", album: "Nevermind"),
            Song.RelatedSong(title: "Heart-Shaped Box", album: "In Utero")
         ]),
    
    Song(title: "Shape of You",
         artist: "Ed Sheeran",
         album: "Divide",
         genre: .pop,
         shortDescription: "A catchy modern pop hit",
         longDescription: "Shape of You is a chart-topping song by Ed Sheeran known for its infectious rhythm and lyrical charm.",
         relatedSongs: [
            Song.RelatedSong(title: "Perfect", album: "Divide"),
            Song.RelatedSong(title: "Thinking Out Loud", album: "X"),
            Song.RelatedSong(title: "Castle on the Hill", album: "Divide")
         ]),
    
    Song(title: "Lose Yourself",
         artist: "Eminem",
         album: "8 Mile",
         genre: .hipHop,
         shortDescription: "A motivational hip-hop anthem",
         longDescription: "Lose Yourself by Eminem is renowned for its intense lyrics and powerful beat, inspiring many to pursue their dreams.",
         relatedSongs: [
            Song.RelatedSong(title: "Stan", album: "The Marshall Mathers LP"),
            Song.RelatedSong(title: "Without Me", album: "The Eminem Show"),
            Song.RelatedSong(title: "Rap God", album: "The Marshall Mathers LP 2")
         ]),
    
    Song(title: "Rolling in the Deep",
         artist: "Adele",
         album: "21",
         genre: .pop,
         shortDescription: "A soulful pop masterpiece",
         longDescription: "Rolling in the Deep is one of Adele's breakthrough hits, known for its stirring vocals and emotional depth.",
         relatedSongs: [
            Song.RelatedSong(title: "Hello", album: "25"),
            Song.RelatedSong(title: "Someone Like You", album: "21"),
            Song.RelatedSong(title: "Set Fire to the Rain", album: "21")
         ]),
    
    Song(title: "One Dance",
         artist: "Drake",
         album: "Views",
         genre: .hipHop,
         shortDescription: "A dancehall-infused hit",
         longDescription: "One Dance by Drake blends hip-hop with dancehall influences, creating a rhythmically engaging and globally popular track.",
         relatedSongs: [
            Song.RelatedSong(title: "Hotline Bling", album: "Views"),
            Song.RelatedSong(title: "God's Plan", album: "Scorpion"),
            Song.RelatedSong(title: "Started From the Bottom", album: "Nothing Was the Same")
         ])
]
