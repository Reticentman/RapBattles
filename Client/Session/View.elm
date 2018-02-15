module Session.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import RemoteData exposing (RemoteData(..))
import Types exposing (..)

viewAccount : Session -> Html Msg
viewAccount session =
    case session of
      Nothing ->
          a [ href "#login" ] [ text "You must log in!" ]
      Just user ->
          div []
              [ h1 [] [ text <| user.username ++ "'s account " ]
              , div []
                  [ label
                      [ style [ ( "padding", "0px" ) ]
                      ]
                      [ input [ type_ "checkbox" ] []
                      , text "Ready to Rap?"
                      ]
                  , div []
                      [ p [] [ a [ href "#schedule/" ] [ text "Schedule a rap" ] ]
                      ]
                  ]
              ]
