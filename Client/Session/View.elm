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

viewRapper : Html Msg
viewRapper =
    div [ class "row" ]
        [
        div [ class "card text-center rounded w-25 h-75"

            ]
            [ img [ class "card-img-top rounded center"
                  , src "https://static.billets.ca/artist/cjc/s1/chance-the-rapper-200x200.jpg"
                  ]
                  []
            , h5 [ class "alert alert-dark" ]
                 [ text "Chance The Rapper" ]
            , button [ class "btn btn-success" ] [ text "Donate!" ]
            , button [ class "btn btn-light dropdown-toggle"
                     , attribute "data-toggle" "dropdown"
                     , attribute "aria-expanded" "false"
                     ]
                   [ text "Links"
                   ]
                   , div [ class "dropdown-menu" ]
                         [ a [ class "dropdown-item", href "http://chanceraps.com" ]
                             [ text "Personal Link 1" ]
                         , a [ class "dropdown-item", href "http://chanceraps.com" ]
                             [ text "Personal Link 2" ]
                         , a [ class "dropdown-item", href "http://chanceraps.com" ]
                             [ text "Personal Link 3" ]
                         , a [ class "dropdown-item", href "http://chanceraps.com" ]
                             [ text "Personal Link 4" ]
                         , a [ class "dropdown-item", href "http://chanceraps.com" ]
                             [ text "Personal Link 5" ]
                         ]
            ]
        , div [ class "card w-75 h-75"
              ]
              [ h1 [] [ text "Statistics" ]
              , p [ class "alert alert-primary" ] [ text "Battles Performed: 7,577" ]
              , p [ class "alert alert-success" ] [ text "Battles Won: 7,077" ]
              , p [ class "alert alert-danger" ] [ text "Battles Lost: 500"]
              , p [ class "alert alert-dark" ] [ text "Win Percentage: 93.4%" ]
              , p [ class "alert alert-info" ] [ text "Rep 75,521 (Rank: 2)"]
              , button [ class "btn btn-info", title "Click here to give Rep to rappers to help them get bigger!" ] [ text "Give Rep" ]
              ]
        ]
