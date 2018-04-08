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
            viewLogin model.session

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


viewLogin : Session -> Html Msg
viewLogin session =
    case session of
        Nothing ->
            div [ class "well" ]
                [ input [ class "form-control", type_ "text", placeholder "Username" ] []
                , input [ class "form-control", type_ "password", placeholder "Password" ] []
                , button [ class "btn btn-default" ] [ text "Login" ]
                , a [ href "#signup/" ] [ button [ class "btn btn-default" ] [ text "Signup" ] ]
                ]

        Just user ->
            div []
                [ h1 [] [ text "You are already logged in!" ] ]


imgChance : String
imgChance =
    "https://static.billets.ca/artist/cjc/s1/chance-the-rapper-200x200.jpg"


imgDjKhalad : String
imgDjKhalad =
    "http://img.ulximg.com/image/300x300/cover/1392851025_3adb526857f8dd14ea9832390610cf40.jpg/9fc641ae561ef021c4aa2a7393b0e89d/1392851025_dj_khaled_27.jpg"


repTitle : String
repTitle =
    "Click here to give Rep to rappers to help them get bigger!"


viewChallenges : Model -> Html Msg
viewChallenges model =
    div
        [ class "row"
        , id "battle"
        ]
        [ div [ class "card col w-25" ]
            [ img [ class "card-img-top img-rounded flex-center", src imgChance ] []
            , h1 [ class "card-title", style [ ( "font-size", "34px" ) ] ] [ text "Chance The Rapper" ]
            , p [ class "card-title text-danger" ] [ text "Rep 75,521" ]
            , a [ href "http://chanceraps.com", class "card-body text-primary" ] [ text "Chances Website" ]
            , button
                [ class "btn btn-light", title repTitle, onClick AddRep ]
                [ text "Give Rep" ]
            , button
                [ class "btn btn-light text-warning"
                , attribute "data-toggle" "popover"
                , attribute "data-placement" "left"
                , title "This is the Rep that you have left to give!"
                , disabled True
                ]
                [ text (toString model.rep) ]
            , div []
                [ a
                    [ class "btn btn-light"
                    , href "#rapper/ChanceTheRapper"
                    ]
                    [ text "Username" ]
                ]
            ]
        , div
            [ class "col w-50"
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
                    []
                    []
                ]
            ]
        , div
            [ class "col card w-25"
            ]
            [ img
                [ class "card-img-top"
                , class "rounded"
                , src imgDjKhalad
                , class "img-rounded flex-center"
                ]
                []
            , p [ class "card-title", style [ ( "font-size", "34px" ) ] ] [ text "DJ Khalad" ]
            , p [ class "text-info text-danger" ] [ text "Rep 100k+" ]
            , a [ href "#", class "card-body text-primary" ] [ text "Personal Links here" ]
            , a [ href "" ]
                [ button
                    [ class "btn btn-light", title repTitle ]
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
                    [ class "btn btn-light"
                    ]
                    [ text "Profile"
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
