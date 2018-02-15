module User.Encode exposing (one)

import Json.Encode as Encode
import Types exposing (..)

one : User -> Encode.Value
one user =
    let
        attributes =
            [ ( "username", Encode.string user.username )
            , ( "online", Encode.bool user.online )
            , ( "image", Encode.string user.image )
            , ( "email", Encode.string user.email )
            , ( "password", Encode.string user.password)
            ]
      in
          Encode.object attributes
