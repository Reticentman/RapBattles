module View exposing (..)

import Form exposing (Form)
import Form.Input as Input
import Form.Validate as Validate exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import RemoteData exposing (RemoteData(..))
import Session.View
import Set exposing (Set)
import Types exposing (..)
import Dict exposing (..)


bootstrap =
    div []
        [ node "script"
            [ src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            ]
            []
        , node "script"
            [ src "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"
            ]
            []
        , node "link"
            [ rel "stylesheet"
            , href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            ]
            []
        , node "script"
            [ src "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            ]
            []
        , node "link"
            [ rel "stylesheet"
            , href "/client/style.css"
            ]
            []
        ]


navbar model =
    nav
        [ class "nav nav-pills navbar-expand-md navbar-light mb-0"
        ]
        [ button
            [ class "navbar-toggler btn-default"
            , attribute "data-toggle" "collapse"
            , attribute "data-target" "#navbarNav"
            , attribute "aria-controls" "navbarNav"
            , attribute "aria-expanded" "false"
            , attribute "aria-label" "Toggle navigation"
            ]
            [ span
                [ class "navbar-toggler-icon"
                ]
                []
            ]
        , div
            [ class "collapse navbar-collapse navbar-nav-scroll text-center"
            , id "navbarNav"
            ]
            [ ul
                [ class "navbar-nav"
                ]
                [ li
                    [ class "nav-item"
                    ]
                    [ a [ class "nav-link", href "#challenges" ] [ text "Home" ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link", href "#signup" ] [ text "Signup" ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link", href "#rapper" ] [ text "Rappers" ]
                    ]
                , li [ class "nav-item" ]
                    [ a [ class "nav-link", href "#search" ] [ text "Search" ]
                    ]
                ]
            ]
        ]


root : Model -> Html Msg
root model =
    div [ class "container-fluid" ]
        [ bootstrap
        , navbar model
        , div
            []
            [ page model ]
        ]


page : Model -> Html Msg
page model =
    case model.route of
        Types.Main ->
            root model

        Types.Login ->
            notFoundView

        Types.Challenges ->
            viewChallenges model

        Types.Promoted ->
            viewChallenges model

        Types.Rapper username ->
            case Dict.get username model.rappers of
                Just u ->
                    Session.View.viewRapper u

                Nothing ->
                    text "Sorry bruv"

        Types.NewPicWhoDis ->
            setPic model

        Types.NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]


viewChallenges : Model -> Html Msg
viewChallenges model =
    div
        [ class "row"
        , id "battle"
        , style [ ( "width", "1300px" ) ]
        ]
        [ div [ class "col text-center" ]
            [ div
                [ class "card"
                ]
                [ img [ class "card-img-top", class "rounded", src "https://static.billets.ca/artist/cjc/s1/chance-the-rapper-200x200.jpg", class "img-rounded" ] []
                , p [ class "card-title" ] [ text "name" ]
                , p [ class "card-title text-danger" ] [ text "Rep 75,521" ]
                , a [ href "#", class "card-body text-primary" ] [ text "Personal Links here" ]
                , button
                    [ class "btn btn-light", title "Click here to give Rep to rappers to help them get bigger!", onClick AddRep ]
                    [ text "Give Rep" ]
                , button
                    [ class "btn btn-light text-warning"
                    , attribute "data-toggle" "popover"
                    , attribute "data-placement" "left"
                    , title "This is the Rep that you have left to give!"
                    , disabled True
                    ]
                    [ text (toString model.rep) ]
                , div [ class "dropdown" ]
                    [ button
                        [ class "btn btn-light dropdown-toggle"
                        , attribute "data-toggle" "dropdown"
                        , attribute "aria-expanded" "false"
                        ]
                        [ text "Profile"
                        ]
                    , div [ class "dropdown-menu" ]
                        [ a [ class "dropdown-item", href "#search" ]
                            [ text "Username" ]
                        ]
                    ]
                ]
            ]
        , div
            [ class "col-sm text-center"
            , id "middleBattle"
            ]
            [ p [ class "alert alert-success", style [ ( "font-size", "34px" ) ] ] [ text "Nick with a $7mil Donation!" ]
            , div []
                [ iframe
                    [ width 600
                    , height 200
                    , src "https://www.youtube.com/embed/tOnTPW1MTZ4"
                    ]
                    []
                ]
            , div []
                [ textarea
                    [ style
                        [ ( "width", "600px" )
                        , ( "height", "150px" )
                        ]
                    ]
                    []
                ]
            ]
        , div [ class "col-sm text-center" ]
            [ div
                [ class "card"
                ]
                [ img
                    [ class "card-img-top"
                    , class "rounded"
                    , src "http://img.ulximg.com/image/300x300/cover/1392851025_3adb526857f8dd14ea9832390610cf40.jpg/9fc641ae561ef021c4aa2a7393b0e89d/1392851025_dj_khaled_27.jpg"
                    , class "img-rounded flex-center"
                    ]
                    []
                , p [ class "card-title" ] [ text "DJ Khalad" ]
                , p [ class "text-info text-danger" ] [ text "Rep 100k+" ]
                , a [ href "#", class "card-body text-primary" ] [ text "Personal Links here" ]
                , a [ href "#/search" ]
                    -- test
                    [ button
                        [ class "btn btn-light", title "Click here to give Rep to rappers to help them get bigger!" ]
                        [ text "Give Rep" ]
                    ]
                , button
                    [ class "btn btn-light text-warning"
                    , attribute "data-toggle" "popover"
                    , attribute "data-placement" "right"
                    , title "This is the Rep that you have left to give!"
                    , disabled True --enable this when purchasing Rep is avaible, this will be a link to said store.
                    ]
                    [ text "(50 left)" ]
                , div [ class "dropdown" ]
                    [ button
                        [ class "btn btn-light dropdown-toggle"
                        , attribute "data-toggle" "dropdown"
                        , attribute "aria-expanded" "false"
                        ]
                        [ text "Profile"
                        ]
                    , div [ class "dropdown-menu" ]
                        [ a [ class "dropdown-item", href "#search" ]
                            [ text "Username" ]
                        ]
                    ]
                ]
            ]
        ]


setPic : Model -> Html Msg
setPic model =
    div []
        [ img [ src model.pic ] []
        , input [ type_ "text", placeholder "Input a picture in string form!", onInput SetPic ] []
        ]
