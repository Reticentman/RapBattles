module Session.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import RemoteData exposing (RemoteData(..))
import Types exposing (..)


viewRapper : User  ->  Html Msg
viewRapper user  =
         div [ class "row"
            , id "rapperview"
            ]
            [ div [ id "ProfilePic" ]
                  [ div []  [ img [ src  user.image ] [] ]
                  , h5 [ class "alert alert-dark" ]
                      [ text user.username ]
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
                  , p [ class "alert alert-info" ] [ text <| "Rep earned: " ++ (toString user.rep) ]
                  , button [ class "btn btn-info", title "Click here to give Rep to rappers to help them get bigger!" ] [ text "Give Rep" ]
                  ]
            , div [ class "pl-50" ]
                [ iframe [ width 650
                         , height 350
                         , src "https://www.youtube.com/embed/wsrPWMeYPxY?ecver=2" ]
                      []
                ]
            ]
