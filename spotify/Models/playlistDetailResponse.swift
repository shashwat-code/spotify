//
//  playlistDetailResponse.swift
//  spotify
//
//  Created by Shashwat on 05/10/21.
//

import Foundation

struct playlistDetailResponse: Codable {
    let description:String
    let external_urls:[String:String]
    let followers: follower
    let id:String
    let images : [ImageModel]
    let name :String
    let tracks : playlistTrackResponse
    
}
struct playlistTrackResponse:Codable {
    let items: [playlistItem]
}

struct playlistItem:Codable {
    let track:  AudioTrack
}

struct follower:Codable {
    let total:Int
}


//    owner =     {
//        "display_name" = Spotify;
//        "external_urls" =         {
//            spotify = "https://open.spotify.com/user/spotify";
//        };
//        href = "https://api.spotify.com/v1/users/spotify";
//        id = spotify;
//        type = user;
//        uri = "spotify:user:spotify";
//    };
//    "primary_color" = "#ffffff";
//    public = 0;
//    "snapshot_id" = MTYzMzQ0MzUyMiwwMDAwMDAwMDQ4NGUwYTE4YzE4NWQ2ZGYyNGUzNTVlMWQ3MDRhODIx;
//    tracks =     {
//        href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX7cLxqtNO3zl/tracks?offset=0&limit=100";
//        items =         (
//            {
//                "added_at" = "2021-06-03T19:23:39Z";
//                "added_by" =                 {
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/";
//                    };
//                    href = "https://api.spotify.com/v1/users/";
//                    id = "";
//                    type = user;
//                    uri = "spotify:user:";
//                };
//                "is_local" = 0;
//                "primary_color" = "<null>";
//                track =                 {
//                    album =                     {
//                        "album_type" = single;
//                        artists =                         (
//                            {
//                                "external_urls" =                                 {
//                                    spotify = "https://open.spotify.com/artist/0LyfQWJT6nXafLPZqxe9Of";
//                                };
//                                href = "https://api.spotify.com/v1/artists/0LyfQWJT6nXafLPZqxe9Of";
//                                id = 0LyfQWJT6nXafLPZqxe9Of;
//                                name = "Various Artists";
//                                type = artist;
//                                uri = "spotify:artist:0LyfQWJT6nXafLPZqxe9Of";
//                            }
//                        );
//                        "available_markets" =                         (
//                            AD,
//
//                            ZA,
//                            ZM,
//                            ZW
//                        );
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/album/7IfUPFe5MSwcAp2Vw8ohF5";
//                        };
//                        href = "https://api.spotify.com/v1/albums/7IfUPFe5MSwcAp2Vw8ohF5";
//                        id = 7IfUPFe5MSwcAp2Vw8ohF5;
//                        images =                         (
//                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b273bd04f8c4ddaa8586e3f1505d";
//                        width = 640;
//                        },
//                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e02bd04f8c4ddaa8586e3f1505d";
//                        width = 300;
//                        },
//                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d00004851bd04f8c4ddaa8586e3f1505d";
//                        width = 64;
//                        }
//                        );
//                        name = "BurjKhalifa (From \"Laxmii\")";
//                        "release_date" = "2020-10-18";
//                        "release_date_precision" = day;
//                        "total_tracks" = 1;
//                        type = album;
//                        uri = "spotify:album:7IfUPFe5MSwcAp2Vw8ohF5";
//                    };
//                    artists =                     (
//                        {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/5EXIQQjCaCnRPJ68SxYURB";
//                            };
//                            href = "https://api.spotify.com/v1/artists/5EXIQQjCaCnRPJ68SxYURB";
//                            id = 5EXIQQjCaCnRPJ68SxYURB;
//                            name = Shashi;
//                            type = artist;
//                            uri = "spotify:artist:5EXIQQjCaCnRPJ68SxYURB";
//                        },
//                        {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/6xElGyunMSlnuJ2vabDUWA";
//                            };
//                            href = "https://api.spotify.com/v1/artists/6xElGyunMSlnuJ2vabDUWA";
//                            id = 6xElGyunMSlnuJ2vabDUWA;
//                            name = "DJ Khushi";
//                            type = artist;
//                            uri = "spotify:artist:6xElGyunMSlnuJ2vabDUWA";
//                        },
//                        {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/3tPQOjkxO3mrYrrgkTeXgH";
//                            };
//                            href = "https://api.spotify.com/v1/artists/3tPQOjkxO3mrYrrgkTeXgH";
//                            id = 3tPQOjkxO3mrYrrgkTeXgH;
//                            name = "Nikhita Gandhi";
//                            type = artist;
//                            uri = "spotify:artist:3tPQOjkxO3mrYrrgkTeXgH";
//                        },
//                        {
//                            "external_urls" =                             {
//                                spotify = "https://open.spotify.com/artist/4x4Q6d60hC0ZuLloMeCLoS";
//                            };
//                            href = "https://api.spotify.com/v1/artists/4x4Q6d60hC0ZuLloMeCLoS";
//                            id = 4x4Q6d60hC0ZuLloMeCLoS;
//                            name = Madhubanti;
//                            type = artist;
//                            uri = "spotify:artist:4x4Q6d60hC0ZuLloMeCLoS";
//                        }
//                    );
//                    "available_markets" =
