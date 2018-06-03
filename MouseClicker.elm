module MouseClicker exposing (..)

import Html exposing (..)
import Mouse exposing (..)

main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { x : Int
    , y : Int
    }

init : (Model, Cmd Msg) 
init =
  (Model 0 0, Cmd.none)

type Msg 
    = MouseMsg Mouse.Position


update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of
        MouseMsg position -> 
            ( { model | x = position.x, y = position.y }, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Mouse.clicks MouseMsg

view : Model -> Html Msg
view model = 
   div [] 
       [ text 
          ("Position X is "
            ++ (toString model.x)
            ++ " Position Y is "
            ++ (toString model.y)
          )
       ]
