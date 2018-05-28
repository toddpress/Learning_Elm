module Statuses exposing (..)

import Html exposing (..)


checkStatus : Int -> String
checkStatus status =
    if status == 200 then
        "Sweet, way to go dude"
    else if status == 404 then
        "Wait, what the wtf?"
    else
        "Unknown issue"


statusChecks : List String
statusChecks =
    [ checkStatus 200
    , checkStatus 404
    , checkStatus 418
    ]


renderList : List String -> Html msg
renderList lst =
    lst
        |> List.map createLi
        |> ul []

createLi : String -> Html msg
createLi str =
    li [] [ text str ]

main : Html msg
main =
    div []
        [ h1 [] [ text "List of Statuses:" ]
        , renderList statusChecks
        ]
