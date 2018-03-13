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

viewRapper : Model ->  Html Msg
viewRapper model  =
    div [ class "row"
        , id "rapperview"
        ] 
        [ div [ id "ProfilePic" ]
              [ div [] <| List.map (\r -> img [ src r.image ] []) model.rappers
              , h5 [ class "alert alert-dark" ]
                  [ text "" ]
              , button [ class "btn btn-success w-50" ] [ text "Donate!" ]
              , button [ class "btn btn-light dropdown-toggle w-50"
                       , attribute "data-toggle" "dropdown"
                       , attribute "aria-expanded" "false"
                       ]
                    [ text "Links"
                    ]
              , div [ class "dropdown-menu" ]
                  [ a [ class "dropdown-item", href "" ]
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
              , h1 [] [ text "Statistics" ]
              , p [ class "alert alert-primary" ] [ text "Battles Performed: 7,577" ]
              , p [ class "alert alert-success" ] [ text "Battles Won: 7,077" ]
              , p [ class "alert alert-danger" ] [ text "Battles Lost: 500"]
              , p [ class "alert alert-dark" ] [ text "Win Percentage: 93.4%" ]
              , p [ class "alert alert-info" ] [ text ("Rep (Rank: 2)")]
              , button [ class "btn btn-info", title "Click here to give Rep to rappers to help them get bigger!" ] [ text "Give Rep" ]
              ]
        , div [ class "pl-50" ]
            [ iframe [ width 650
                     , height 350
                     , src "https://www.youtube.com/embed/wsrPWMeYPxY?ecver=2" ]
                  []
            ]
        ]
        
