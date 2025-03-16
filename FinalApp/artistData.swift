//
//  artistData.swift
//  FinalApp
//
//  Created by Serhat Cingilli on 3/16/25.
//

import Foundation

struct ArtistInfo {
    let name: String
    let genre: String
    let monthlyListeners: Int  
    let yearFormed: Int       
}

let artistDatabase = [
    ArtistInfo(name: "Taylor Swift", genre: "Pop", monthlyListeners: 83500000, yearFormed: 2006),
    ArtistInfo(name: "Drake", genre: "Hip Hop", monthlyListeners: 67800000, yearFormed: 2006),
    ArtistInfo(name: "The Weeknd", genre: "R&B", monthlyListeners: 75600000, yearFormed: 2010),
    ArtistInfo(name: "Bad Bunny", genre: "Reggaeton", monthlyListeners: 59400000, yearFormed: 2016),
    ArtistInfo(name: "Billie Eilish", genre: "Pop", monthlyListeners: 47900000, yearFormed: 2016),
    ArtistInfo(name: "Ed Sheeran", genre: "Pop", monthlyListeners: 78300000, yearFormed: 2004),
    ArtistInfo(name: "Ariana Grande", genre: "Pop", monthlyListeners: 68200000, yearFormed: 2008),
    ArtistInfo(name: "Justin Bieber", genre: "Pop", monthlyListeners: 63100000, yearFormed: 2008),
    ArtistInfo(name: "Post Malone", genre: "Hip Hop", monthlyListeners: 42500000, yearFormed: 2013),
    ArtistInfo(name: "BTS", genre: "K-Pop", monthlyListeners: 41600000, yearFormed: 2013),
    ArtistInfo(name: "Dua Lipa", genre: "Pop", monthlyListeners: 56800000, yearFormed: 2014),
    ArtistInfo(name: "Coldplay", genre: "Alternative Rock", monthlyListeners: 44300000, yearFormed: 1996),
    ArtistInfo(name: "Queen", genre: "Rock", monthlyListeners: 38900000, yearFormed: 1970),
    ArtistInfo(name: "Eminem", genre: "Hip Hop", monthlyListeners: 52700000, yearFormed: 1988),
    ArtistInfo(name: "Rihanna", genre: "R&B", monthlyListeners: 48200000, yearFormed: 2005),
    ArtistInfo(name: "Bruno Mars", genre: "Pop", monthlyListeners: 44900000, yearFormed: 2004),
    ArtistInfo(name: "Beyoncé", genre: "R&B", monthlyListeners: 39500000, yearFormed: 1997),
    ArtistInfo(name: "Lady Gaga", genre: "Pop", monthlyListeners: 33700000, yearFormed: 2001),
    ArtistInfo(name: "Kanye West", genre: "Hip Hop", monthlyListeners: 45600000, yearFormed: 1996),
    ArtistInfo(name: "Michael Jackson", genre: "Pop", monthlyListeners: 28400000, yearFormed: 1964),
    ArtistInfo(name: "Harry Styles", genre: "Pop", monthlyListeners: 56200000, yearFormed: 2010),
    ArtistInfo(name: "Kendrick Lamar", genre: "Hip Hop", monthlyListeners: 38400000, yearFormed: 2004),
    ArtistInfo(name: "Travis Scott", genre: "Hip Hop", monthlyListeners: 44700000, yearFormed: 2008),
    ArtistInfo(name: "Adele", genre: "Pop", monthlyListeners: 36800000, yearFormed: 2006),
    ArtistInfo(name: "Imagine Dragons", genre: "Alternative Rock", monthlyListeners: 41100000, yearFormed: 2008),
    ArtistInfo(name: "J Balvin", genre: "Reggaeton", monthlyListeners: 37500000, yearFormed: 2004),
    ArtistInfo(name: "The Beatles", genre: "Rock", monthlyListeners: 24900000, yearFormed: 1960),
    ArtistInfo(name: "Maroon 5", genre: "Pop Rock", monthlyListeners: 34800000, yearFormed: 1994),
    ArtistInfo(name: "Twenty One Pilots", genre: "Alternative", monthlyListeners: 22700000, yearFormed: 2009),
    ArtistInfo(name: "Blackpink", genre: "K-Pop", monthlyListeners: 31600000, yearFormed: 2016),
    ArtistInfo(name: "David Guetta", genre: "EDM", monthlyListeners: 33200000, yearFormed: 1984),
    ArtistInfo(name: "Calvin Harris", genre: "EDM", monthlyListeners: 29500000, yearFormed: 1999),
    ArtistInfo(name: "Doja Cat", genre: "Hip Hop/Pop", monthlyListeners: 43800000, yearFormed: 2012),
    ArtistInfo(name: "Megan Thee Stallion", genre: "Hip Hop", monthlyListeners: 26400000, yearFormed: 2016),
    ArtistInfo(name: "Cardi B", genre: "Hip Hop", monthlyListeners: 28900000, yearFormed: 2015),
    ArtistInfo(name: "Shawn Mendes", genre: "Pop", monthlyListeners: 31700000, yearFormed: 2013),
    ArtistInfo(name: "Olivia Rodrigo", genre: "Pop", monthlyListeners: 38900000, yearFormed: 2020),
    ArtistInfo(name: "Daddy Yankee", genre: "Reggaeton", monthlyListeners: 27300000, yearFormed: 1992),
    ArtistInfo(name: "The Kid LAROI", genre: "Hip Hop/Pop", monthlyListeners: 24100000, yearFormed: 2018),
    ArtistInfo(name: "Juice WRLD", genre: "Hip Hop", monthlyListeners: 26800000, yearFormed: 2015),
    ArtistInfo(name: "Lil Nas X", genre: "Hip Hop/Pop", monthlyListeners: 28700000, yearFormed: 2018),
    ArtistInfo(name: "Karol G", genre: "Reggaeton", monthlyListeners: 33400000, yearFormed: 2012),
    ArtistInfo(name: "Arctic Monkeys", genre: "Indie Rock", monthlyListeners: 20700000, yearFormed: 2002),
    ArtistInfo(name: "The Rolling Stones", genre: "Rock", monthlyListeners: 19800000, yearFormed: 1962),
    ArtistInfo(name: "AC/DC", genre: "Hard Rock", monthlyListeners: 22300000, yearFormed: 1973),
    ArtistInfo(name: "Metallica", genre: "Metal", monthlyListeners: 21600000, yearFormed: 1981),
    ArtistInfo(name: "Pink Floyd", genre: "Progressive Rock", monthlyListeners: 17900000, yearFormed: 1965),
    ArtistInfo(name: "Nirvana", genre: "Grunge", monthlyListeners: 18400000, yearFormed: 1987),
    ArtistInfo(name: "Central Cee", genre: "UK Drill", monthlyListeners: 23200000, yearFormed: 2015),
    ArtistInfo(name: "SZA", genre: "R&B", monthlyListeners: 30100000, yearFormed: 2011)
]