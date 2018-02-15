module User.State exposing (update)

import Http
import RemoteData
import Types exposing (..)
import User.Decode

update : Model -> User -> Model
update model updatedUser =
    let
        pick currentUser =
            if updatedUser.id == currentUser.id then
                updatedUser
            else
                currentUser
                
        updatedUserList users =
            List.map pick users

        updatedUsers =
            RemoteData.map updateUserList model.users
    in
        { model | users = updatedUsers }
