module Main exposing (..)

import Form
import Navigation exposing (Location)
import RemoteData
import Routing
import State exposing (update, searchFilter)
import Types exposing (Model, Msg(..))
import View exposing (root)


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
      { init = init
      , view = root
      , update = update
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
          , search = Nothing
          , searchFilter = searchFilter
          , session = Nothing
          , form = Form.initial [] State.validation
          , rappers = [ { username = "Chance The Rapper"
                        , image = "https://static.billets.ca/artist/cjc/s1/chance-the-rapper-200x200.jpg"
                        , email = "chance@gmail.com"
                        , password = "123"
                        , online = True
                        , rep = 75000
                        , links = "Link"
                        }
                      ]
          }
          , Cmd.none
        )
