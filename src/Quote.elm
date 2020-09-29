module Quote exposing (Quote, decoder)

import Array exposing (Array)
import Json.Decode as D



-- QUOTE


type alias Quote =
    { id : String, tags : Array String, content : String, author : String, length : Int }



-- DECODER


decoder : D.Decoder Quote
decoder =
    D.map6 Quote
        (D.field "id" D.string)
        (D.field "tags" tagDecoder)
        (D.field "content" D.string)
        (D.field "author" D.string)
        (D.field "length" D.int)
