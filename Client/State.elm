module State exposing (update)

import Form exposing (Form)
import Form.Input as Input
import Form.Validate as Validate
import Html exposing (button, text, Html)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode
import Json.Encode as Encode
import Navigation exposing (Location)
import RemoteData
import Routing
import Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange loc ->
            ( { model | route = Routing.parseLocation loc }, Cmd.none )

        AddRep ->
            ( { model | rep = model.rep + 1 }, Cmd.none )

        SetPic pic ->
            ( { model | pic = pic }, Cmd.none )


addRep : User -> Int
addRep user =
    user.rep + 1
