//
//  newreleases.swift
//  spotify
//
//  Created by Shashwat on 01/10/21.
//

import Foundation


struct newReleases:Codable {
    let albums: albumResponse
}

struct albumResponse:Codable {
    let items:[album]
}


 //albums =     {
//        href = "https://api.spotify.com/v1/browse/new-releases?offset=0&limit=2";
//        items =         (
//                        {
//                "album_type" = album;
//                artists =                 (
//                                        {
//                        "external_urls" =                         {
//                            spotify = "https://open.spotify.com/artist/20sxb77xiYeusSH8cVdatc";
//                        };
//                        href = "https://api.spotify.com/v1/artists/20sxb77xiYeusSH8cVdatc";
//                        id = 20sxb77xiYeusSH8cVdatc;
//                        name = "Meek Mill";
//                        type = artist;
//                        uri = "spotify:artist:20sxb77xiYeusSH8cVdatc";
//                    }
//                );
//                "available_markets" =                 (
//                    AD,
//                    AE,
//                    AG

//                );
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/album/3Debm2uhGYsgGzvtM4V2Iu";
//                };
//                href = "https://api.spotify.com/v1/albums/3Debm2uhGYsgGzvtM4V2Iu";
//                id = 3Debm2uhGYsgGzvtM4V2Iu;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/ab67616d0000b27351dd2ce1ed065993c13a79ae";
//                        width = 640;
//                    },
//                                        {
//                        height = 300;
//                        url = "https://i.scdn.co/image/ab67616d00001e0251dd2ce1ed065993c13a79ae";
//                        width = 300;
//                    },
//                                        {
//                        height = 64;
//                        url = "https://i.scdn.co/image/ab67616d0000485151dd2ce1ed065993c13a79ae";
//                        width = 64;
//                    }
//                );
//                name = "Expensive Pain";
//                "release_date" = "2021-10-01";
//                "release_date_precision" = day;
//                "total_tracks" = 18;
//                type = album;
//                uri = "spotify:album:3Debm2uhGYsgGzvtM4V2Iu";
//            },

//}
//
