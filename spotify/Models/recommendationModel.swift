//
//  recommendationModel.swift
//  spotify
//
//  Created by Shashwat on 01/10/21.
//

import Foundation

struct recommendationModel:Codable {
    //let seeds: [track]
    let tracks: [track]
}
struct track:Codable {
    let album: album
    let disc_number:Int
    let duration_ms:Int
    let external_urls:[String:String]
    let id:String
    let explicit:Bool
    let name:String
    let popularity:Int
}


// = "Knock Knock - Single";
//            "release_date" = 2010;
//            "release_date_precision" = year;
//            "total_tracks" = 1;
//            type = album;
//            uri = "spotify:album:5ICp41WijCKVXXtxS0BVx8";
//        };
//tracks =     (
//            {
//        album =             {
//            "album_type" = SINGLE;
//            artists =                 (
//                                    {
//                    "external_urls" =                         {
//                        spotify = "https://open.spotify.com/artist/4LLpKhyESsyAXpc4laK94U";
//                    };
//                    href = "https://api.spotify.com/v1/artists/4LLpKhyESsyAXpc4laK94U";
//                    id = 4LLpKhyESsyAXpc4laK94U;
//                    name = "Mac Miller";
//                    type = artist;
//                    uri = "spotify:artist:4LLpKhyESsyAXpc4laK94U";
//                }
//            );
//            "available_markets" =                 (
//                AD,
//                AE,
//                AG,
//                AL,
//                AM,
//                AO,
//                AR,
//                AT,
//                AU,
//
//                XK,
//                ZA,
//                ZM,
//                ZW
//            );
//            "external_urls" =                 {
//                spotify = "https://open.spotify.com/album/5ICp41WijCKVXXtxS0BVx8";
//            };
//            href = "https://api.spotify.com/v1/albums/5ICp41WijCKVXXtxS0BVx8";
//            id = 5ICp41WijCKVXXtxS0BVx8;
//            images =                 (
//                                    {
//                    height = 640;
//                    url = "https://i.scdn.co/image/ab67616d0000b273c7d17e0fc5e9b5d963bda62d";
//                    width = 640;
//                },
//                                    {
//                    height = 300;
//                    url = "https://i.scdn.co/image/ab67616d00001e02c7d17e0fc5e9b5d963bda62d";
//                    width = 300;
//                },
//                                    {
//                    height = 64;
//                    url = "https://i.scdn.co/image/ab67616d00004851c7d17e0fc5e9b5d963bda62d";
//                    width = 64;
//                }
//            );
//
//        artists =             (
//                            {
//                "external_urls" =                     {
//                    spotify = "https://open.spotify.com/artist/4LLpKhyESsyAXpc4laK94U";
//                };
//                href = "https://api.spotify.com/v1/artists/4LLpKhyESsyAXpc4laK94U";
//                id = 4LLpKhyESsyAXpc4laK94U;
//                name = "Mac Miller";
//                type = artist;
//                uri = "spotify:artist:4LLpKhyESsyAXpc4laK94U";
//            }
//        );
//        "available_markets" =             (
//            AD,
