module Site (component) where

import Prelude

import Effect.Aff.Class (class MonadAff)
import Halogen (ClassName(..))
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Properties as HP

--------------------------------------------------------------------------------
-- Types

type State = Unit
data Action = Void

--------------------------------------------------------------------------------
-- Component

component :: forall q i o m. MonadAff m => H.Component q i o m
component = H.mkComponent
  { initialState: \_ -> unit
  , render: const render
  , eval: H.mkEval H.defaultEval
  }

--------------------------------------------------------------------------------
-- Render

render :: forall m. H.ComponentHTML Action () m
render =
  HH.div_
    [ hero
    , prose
    , footer
    ]

--------------------------------------------------------------------------------
-- Hero — atmospheric backdrop + single caption

hero :: forall m. H.ComponentHTML Action () m
hero =
  HH.section [ HP.class_ (ClassName "hero") ]
    [ HH.div [ HP.class_ (ClassName "hero__aurora") ] []
    , HH.div [ HP.class_ (ClassName "hero__mast") ]
        [ HH.div [ HP.class_ (ClassName "hero__brand") ] [ HH.text "CX Strategies" ]
        , HH.div [ HP.class_ (ClassName "hero__meta") ]
            [ HH.span_ [ HH.text "Est. 2024" ]
            , HH.span_ [ HH.text "New York" ]
            ]
        ]
    , HH.div [ HP.class_ (ClassName "hero__spacer") ] []
    , HH.div [ HP.class_ (ClassName "hero__caption") ]
        [ HH.div [ HP.class_ (ClassName "hero__caption-eyebrow") ]
            [ HH.text "A proprietary trading firm" ]
        , HH.h1 [ HP.class_ (ClassName "hero__headline") ]
            [ HH.text "Systematic intelligence for prediction markets." ]
        ]
    ]

--------------------------------------------------------------------------------
-- Prose

prose :: forall m. H.ComponentHTML Action () m
prose =
  HH.section [ HP.class_ (ClassName "prose") ]
    [ HH.p_
        [ HH.text
            "CX Strategies builds systems that find and capture inefficiencies in prediction markets."
        ]
    , team
    , HH.div [ HP.class_ (ClassName "prose__cta") ]
        [ HH.p_
            [ HH.text "We're growing carefully, and always looking for exceptional talent. If you thrive in fast-moving environments, enjoy meticulous work, and love thinking about how to optimize the bottom line, we'd love to have you join us in New York — or at least, New York as of the day this was posted. Write to "
            , HH.a [ HP.href "mailto:talent@cxstrategies.io" ]
                [ HH.text "talent@cxstrategies.io" ]
            , HH.text "."
            ]
        , HH.div [ HP.class_ (ClassName "prose__hiring") ]
            [ HH.span_ [ HH.text "Research" ]
            , HH.span_ [ HH.text "Engineering" ]
            , HH.span_ [ HH.text "Trading" ]
            ]
        ]
    ]

--------------------------------------------------------------------------------
-- Team — inline sentence

team :: forall m. H.ComponentHTML Action () m
team =
  HH.p [ HP.class_ (ClassName "mid") ]
    [ HH.text
        "We are a lean team solving hard problems, with backgrounds from Citadel Securities, Jump Trading, Optiver, and Jane Street."
    ]

--------------------------------------------------------------------------------
-- Footer

footer :: forall m. H.ComponentHTML Action () m
footer =
  HH.footer [ HP.class_ (ClassName "foot") ]
    [ HH.div_ [ HH.text "CX Strategies" ]
    , HH.div [ HP.class_ (ClassName "foot__right") ]
        [ HH.span_ [ HH.text "© 2025" ]
        , HH.span_ [ HH.text "New York" ]
        , HH.span_
            [ HH.a [ HP.href "mailto:talent@cxstrategies.io" ]
                [ HH.text "talent@cxstrategies.io" ]
            ]
        ]
    ]
