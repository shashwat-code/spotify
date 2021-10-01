//
//  getAllFeaturedPlaylistsModel.swift
//  spotify
//
//  Created by Shashwat on 01/10/21.
//

import Foundation

struct featuredPlaylistsModel:Codable {
    let message:String
    let playlists: playlistResponse
   // let playlists: [items]
}

struct playlistResponse:Codable {
    let items:[playlist]
}


struct user:Codable {
    let id:String
    let display_name:String
    let external_urls:[String:String]
    
}


//{
//    message = "Pilihan Editor";
//    playlists =     {
//        href = "https://api.spotify.com/v1/browse/featured-playlists?timestamp=2021-10-01T14%3A55%3A29&offset=0&limit=20";
//        items =         (
//                        {
//                collaborative = 0;
//                description = "The very best in new music from around the world. ";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DWXJfnUiYjUKT";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWXJfnUiYjUKT";
//                id = 37i9dQZF1DWXJfnUiYjUKT;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f000000033be5b15350d2eda71d85a44e";
//                        width = "<null>";
//                    }
//                );
//                name = "New Music Friday";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTYzMzA0MDI4MSwwMDAwMDMzZjAwMDAwMTdjMzhjOTJmMjMwMDAwMDE3YzM4YzhiNjZj;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWXJfnUiYjUKT/tracks";
//                    total = 99;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DWXJfnUiYjUKT";
//            },
//                        {
//                collaborative = 0;
//                description = "New music from Meek Mill, Lil Wayne, Rich The Kid and Wale.";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DX0XUsuxWHRQd";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX0XUsuxWHRQd";
//                id = 37i9dQZF1DX0XUsuxWHRQd;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f00000003480421685a950a576c15f5d8";
//                        width = "<null>";
//                    }
//                );
//                name = RapCaviar;
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTYzMzA2MDgwMCwwMDAwMDVkYzAwMDAwMTdjM2EwMjQ2ODkwMDAwMDE3YzM3ZGMyNDVj;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DX0XUsuxWHRQd/tracks";
//                    total = 50;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DX0XUsuxWHRQd";
//            },
//                        {
//                collaborative = 0;
//                description = "Lil Nas X & Jack Harlow are on top of the Hottest 50!";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DXcBWIGoYBM5M";
//                id = 37i9dQZF1DXcBWIGoYBM5M;
//                images =                 (
//                                        {
//                        height = "<null>";
//                        url = "https://i.scdn.co/image/ab67706f0000000365eb13b95534343a200e141d";
//                        width = "<null>";
//                    }
//                );
//                name = "Today's Top Hits";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTYzMzA2MDgwMCwwMDAwMDRmMDAwMDAwMTdjM2EwMjQ2OGYwMDAwMDE3YzM5NWQwYjFm;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DXcBWIGoYBM5M/tracks";
//                    total = 50;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DXcBWIGoYBM5M";
//            },
