module Reactor exposing (..)

import Main exposing (init, subscriptions)
import Navigation exposing (Location)
import State exposing (update)
import Types
import View exposing (root)

main : Program Never Types.Model Types.Msg
main =
    Navigation.program Types.OnLocationChange
        { init = init
        , view = root
        , update = update
        , subscriptions = subscriptions
        }
