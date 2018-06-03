module ArchitectedHello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- this is what our model will look like


type alias Model =
    { text : String
    , size : Int 
    }


model : Model
model =
    { text = "hello world"
    , size = 10 }


-- Messages - only 1 in this case: Text
type Msg
    = Text 
        | SizeUp
        | SizeDown

-- Update only has to worry about one possible case
update : Msg -> Model -> Model
update msg model =
    case msg of
        Text ->
            { model | text = model.text ++ "!"}
        SizeUp -> 
            { model | size = sizeChecker model.size + 1 }
        SizeDown -> 
            { model | size = sizeChecker model.size }

sizeChecker : Int -> Int
sizeChecker size =
    if size <= 1 then
        size 
    else
        size - 1

view : Model -> Html Msg
view model =
    div []
        [ div
            [ Html.Attributes.style
                [ ( "fontSize", toString model.size ++ "em" )
                , ( "color", "teal" )
                ]
            ]
            [ text model.text ]
        , button [ onClick Text ] [ text "text is great" ]
        , button [ onClick SizeUp ] [ text "+" ]
        , button [ onClick SizeDown ] [ text "-" ]
        ]

generateResult : Model -> Html msg
generateResult { size } = 
    let 
        color =
            if size < 10 then
                 