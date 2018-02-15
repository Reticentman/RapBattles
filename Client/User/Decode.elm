module User.Decode exposing (one, list)

import Json.Decode as Decode
import Types exposing (..)

one : Decode.Decoder User
one =
    Decode.map7 User
      (Decode.field "username" Decode.string)
      (Decode.field "password" Decode.string)
      (Decode.field "image" Decode.string)
      (Decode.field "email" Decode.string)
      (Decode.field "online" Decode.bool)
      (Decode.field "rep" Decode.string)
      (Decode.field "links" Decode.string)

list : Decode.Decoder (List User)
list =
    Decode.list one
