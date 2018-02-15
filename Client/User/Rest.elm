module User.Rest exposing (..)

import Http
import RemoteData
import Types exposing (..)
import User.Decode
import User.Encode


createCmd : User -> Cmd Msg
createCmd user =
    let
        endpoint =
          "/api/v1/user/" ++ user.username

        body =
          Http.jsonBody (User.Encode.one user)


        _ =
            Debug.log (toString body) identity
    in
        Http.post endpoint body User.Decode.one
            |> RemoteData.sendRequest
            |> Cmd.map AddUserResponse

getAll : Cmd Msg
getAll  =
    let
        endpoint =
            "/api/v1/user"

    in
        Http.get endpoint User.Decode.list
            |> RemoteData.sendRequest
            |> Cmd.map UsersResponse
