module State exposing (update, searchFilter, validation)

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
        Search "" ->
            ( { model | search = Just "" }, Cmd.none )

        Search newSearch ->
            ( { model | search = Just newSearch }, Cmd.none )

        OnLocationChange loc ->
            ( { model | route = Routing.parseLocation loc }, Cmd.none )

        SendCreateUser user ->
            ( model, Cmd.none )

        UpdateForm (Form.Submit) ->
            case Form.getOutput model.form of
                Just createUser ->
                    ( model, Cmd.none )

                a ->
                    Debug.log ("Something isn't working properly " ++ toString a) ( model, Cmd.none)

        UpdateForm formMsg ->
            ( { model | form = Form.update validation formMsg model.form }, Cmd.none )

        AddRep ->
            ( model , Cmd.none)

searchFilter : String -> User -> Bool
searchFilter search user =
    String.contains (String.toLower search) (String.toLower user.username)


validation : Validate.Validation () CreateUser
validation =
      Validate.map3 CreateUser
          (Validate.field "username" Validate.string)
          (Validate.field "email" Validate.string)
          (Validate.field "password" Validate.string)

mkUser : CreateUser -> User
mkUser cu =
    { email = cu.email
    , image = "image.png"
    , links = "You can set your own links for yo swag!"
    , password = cu.password
    , rep = 1
    , username = cu.username
    , online = True
    }

addRep : User -> Int
addRep user =
    user.rep + 1
