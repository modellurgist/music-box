port module MusicBox exposing (..)

-- library functions

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- program

type alias Note =
  { tone : String
  , duration : String
  }

type Msg
    = PlayMiddleCNote | PlayDNote


view model =
    div [ class "container" ]
        [
          h1 [] [ text "Let's Play!" ],
          button [ type_ "button", class "btn-warning", onClick PlayMiddleCNote ] [ text "Middle-C" ],
          button [ type_ "button", class "btn", onClick PlayDNote ] [ text "Middle-D" ]
        ]

port play : Note -> Cmd msg

update msg model =
    case msg of
        PlayMiddleCNote ->
            ( model, play { tone = "C4", duration = "8n" } )
        PlayDNote ->
            (model, play { tone = "D3", duration = "8n"})

init =
    ( {}, Cmd.none )

main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
