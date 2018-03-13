module Types exposing (..)

import Form exposing (Form)
import Form.Input as Input
import Form.Validate as Validate exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (RemoteData(..), WebData)


type Route
    = Account
    | Main
    | Login
    | Challenges
    | Promoted
    | Rapper
    | NewPicWhoDis
    | NotFoundRoute

type alias User =
    { username : String
    , image : String
    , email : String
    , password : String
    , online : Bool
    , rep : Int
    , links : String
    }

type alias Model =
    { route : Route
    , session : Session
    , rappers : List User
    , rep : Int
    , pic : String 
    }

type alias CreateUser =
    { username : String
    , email : String
    , password : String
    }

type alias Session =
    Maybe User

type Msg
    = OnLocationChange Location
    | AddRep
    | SetPic String 
