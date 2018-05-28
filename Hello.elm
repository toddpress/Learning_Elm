module Hello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)


main : Html msg
main =
    div [ class "elm-div" ]
        [ h1 [ class "banner" ] [ text "Welcome to my Elm site" ]
        , p [] [ text "I'm really liking elm so far" ]
        , p [] [ text "Eager to learn more about elm" ]
        ]
