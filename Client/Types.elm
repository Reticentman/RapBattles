module Types exposing (..)

import Form exposing (Form)
import Form.Input as Input
import Form.Validate as Validate exposing (..)
import Navigation exposing (Location)
import RemoteData exposing (RemoteData(..), WebData)


type Route
    = Signup
    | Account
    | Main
    | Login
    | Challenges
    | Promoted
    | Rapper
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
    { search : Maybe String
    , searchFilter : String -> User -> Bool
    , route : Route
    , session : Session
--    , battle : WebData (User)
    , form :
        Form () CreateUser
    , rappers : List User
    }

type alias CreateUser =
    { username : String
    , email : String
    , password : String
    }

type alias Session =
    Maybe User

type Msg
    = Search String
    | OnLocationChange Location
    | SendCreateUser User
    | UpdateForm Form.Msg
    | AddRep 
--    | UpdateBattle (WebData User)
