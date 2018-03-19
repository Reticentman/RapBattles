module Main exposing (..)

import Form
import Navigation exposing (Location)
import RemoteData
import Routing
import State exposing (update)
import Types exposing (Model, Msg(..))
import View exposing (root)
import Dict exposing (..)


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = root
        , update = State.update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( { route = currentRoute
          , session = Nothing
          , rappers =
                Dict.fromList
                    [ ( "ChanceTheRapper"
                      , { username = "Chance Baybeeeeee"
                        , image = "https://static.billets.ca/artist/cjc/s1/chance-the-rapper-200x200.jpg"
                        , email = "chance@gmail.com"
                        , password = "123"
                        , online = True
                        , rep = 75000
                        , links = "Link"
                        }
                      )
                    , ( "DjKhaled"
                      , { username = "DJ Khaled"
                        , image = "http://img.ulximg.com/image/300x300/cover/1392851025_3adb526857f8dd14ea9832390610cf40.jpg/9fc641ae561ef021c4aa2a7393b0e89d/1392851025_dj_khaled_27.jpg"
                        , email = "another@one.com"
                        , password = "321"
                        , online = True
                        , rep = 100456
                        , links = "bimble"
                        }
                      )
                    ]
          , rep = 0
          , pic = ""
          }
        , Cmd.none
        )
