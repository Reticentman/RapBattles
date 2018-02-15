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
    | UserPage String
    | Login
    | Challenges
    | Promoted
--    | Battle
    | NotFoundRoute

type alias User =
    { username : String
    , image : String
    , email : String
    , password : String
    , online : Bool
    , rep : String
    , links : String
    }

type alias Model =
    { search : Maybe String
    , users : WebData (List User)
    , searchFilter : String -> User -> Bool
    , route : Route
    , session : Session
--    , battle : WebData (User)
    , form :
        Form () CreateUser
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
    | UsersResponse (WebData (List User))
    | AddUserResponse (WebData User)
    | SendCreateUser User
    | UpdateForm Form.Msg
--    | UpdateBattle (WebData User)
