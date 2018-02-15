module User.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import RemoteData exposing (RemoteData(..))
import Types exposing (..)

root : Model -> Html Msg
root model =
    case model.users of
        Loading ->
            div [] [ text "Loading..." ]

        NotAsked ->
            div [] [ text "Initializing.." ]

        Failure (Http.NetworkError) ->
            div [] [ text "Could not connect to database" ]

        Failure err ->
            div [] [ text <| "Unhandled error type" ++ (toString err) ]

        Success users ->
            let
                predFromModel =
                    model.searchFilter <| Maybe.withDefault "" model.search

                userList =
                    users
                        |> List.filter .online
                        |> List.filter predFromModel
                        |> List.map viewUser

            in
                div []
                    [ h1 [] [ text "Search for a Rapper!" ]
                    , input
                        [ type_ "text"
                        , class "form-control"
                        , placeholder "Enter a name"
                        , onInput Search
                        ]
                         []
                    , div
                         [ class "list-group"
                         , style [ ( "margin-top", "20px" ) ]
                         ]
                         userList
                    ]

accountLink model =
    case model.session of
        Nothing ->
            a [ href "#login" ] [ text "Login" ]

        Just me ->
            a [ href "#account" ] [ text <| "welcome, " ++ me.username ++"!"]


viewUser : User -> Html Msg
viewUser user =
    a
        [ href ("#user/" ++ user.username)
        , class "list-group-item"
        ]
        [ div [ class "media"]
          [ div [ class "media-left" ]
              [ img [ src user.image ] []
              ]
          , div [ class "media-body" ]
              [ h4 [ class "media-heading" ]
                  [ text user.username
                  , span
                      [ class "badge"
                      , style [ ( "margin-left", "10px" ) ]
                      ]
                      [ text "Online" ]
                  , div [ class "media-body" ]
                      [ h5 [ class "media-body" ]
                          [ text user.email ] --replace this with rep
                      ]
                  ]
              ]
           ]
        ]

viewUserPage : User -> Html Msg
viewUserPage user =
    div [ class "header" ]
        [ text <| "Welcome, " ++ user.username ++ "!"
        , div [ class "header" ]
            [ h1 [] [ text "You trynna rap battle??" ]
            , button [ class "btn btn-default" ] [ text "Yes!" ]
            , button [ class "btn btn-default" ] [ text "Nah, just chillin'" ]
            ]
            ]

viewRapper : User -> Html Msg
viewRapper user =
      div [ class "well" ]
          [ div
              [ style
                  [ ( "height", "150px" )
                  , ( "width", "300%" )
                  ]
              ]
              [ img [ src user.image ] []
              ]
          , div []
              [ h4 []
                  [ text user.username
                  , span
                      [ class "badge"
                      , style [ ( "margin-left", "10px" ) ]
                      ]
                      [ text user.rep ]
                  , span
                      [ style
                          [ ( "margin-left", "235px" )
                          , ( "height", "40px" )
                          ]
                      ]
                      [ text user.links ]
                  , span
                      [ style [ ( "margin-left", "350px" ) ]
                      ]
                      [ a [ href ("#user/" ++ user.username)
                          , class "list-group-item"
                          ]
                          [ text user.username ]
                          ]
                      ]
                  , div []
                      [ h5 []
                          [ text user.image ]
                      ]
                ]
            ]
