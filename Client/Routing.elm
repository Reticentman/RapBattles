module Routing exposing (..)

import Navigation exposing (Location)
import Types
import UrlParser as Url exposing ((</>), string)


matchers : Url.Parser (Types.Route -> a) a
matchers =
    Url.oneOf
        [ Url.map Types.Main Url.top
        , Url.map Types.Login (Url.s "login")
        , Url.map Types.Promoted (Url.s "promoted")
        , Url.map Types.Challenges (Url.s "challenges")
        , Url.map Types.Rapper (Url.s "rapper")
        , Url.map Types.NewPicWhoDis (Url.s "NewPicWhoDis")
        ]

parseLocation : Location -> Types.Route
parseLocation location =
    case (Url.parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            Types.NotFoundRoute
