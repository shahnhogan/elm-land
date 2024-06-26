module Layouts.Sidebar exposing (Model, Msg, Props, layout)

import Effect exposing (Effect)
import Html exposing (Html)
import Html.Attributes exposing (class, style)
import Html.Events
import Layout exposing (Layout)
import Route exposing (Route)
import Route.Path
import Shared
import View exposing (View)


type alias Props =
    {}


layout : Props -> Shared.Model -> Route () -> Layout () Model Msg contentMsg
layout props shared route =
    Layout.new
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    {}


init : () -> ( Model, Effect Msg )
init _ =
    ( {}, Effect.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    ( model, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : { toContentMsg : Msg -> contentMsg, content : View contentMsg, model : Model } -> View contentMsg
view { toContentMsg, model, content } =
    { title = content.title ++ " | MyCoolApp"
    , body =
        [ Html.div [ style "display" "flex", style "height" "100%" ]
            [ Html.aside [ class "sidebar" ]
                [ Html.div
                    [ style "display" "flex"
                    , style "flex-direction" "column"
                    , style "gap" "2rem"
                    ]
                    [ Html.strong [ style "font-size" "1.5rem" ]
                        [ Html.text "🌈  MyCoolApp" ]
                    , Html.div
                        [ style "display" "flex"
                        , style "flex-direction" "column"
                        , style "gap" "1rem"
                        ]
                        (List.map viewSidebarLink
                            [ ( "Dashboard", Route.Path.Home_ )
                            ]
                        )
                    ]
                ]
            , Html.main_ [ style "flex" "1 1 auto" ] content.body
            ]
        ]
    }


viewSidebarLink : ( String, Route.Path.Path ) -> Html msg
viewSidebarLink ( label, routePath ) =
    Html.a
        [ Route.Path.href routePath ]
        [ Html.text label ]
