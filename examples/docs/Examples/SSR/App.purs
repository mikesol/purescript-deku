module Deku.Examples.Docs.Examples.SSR.App where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (class MonadST)
import Data.Monoid.Always (class Always)
import Data.Profunctor (lcmap)
import Deku.Always (halways)
import Deku.Control (text, text_)
import Deku.Core (Domable, vbussed)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Effect (Effect)
import FRP.Event (bang, fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

app
  :: forall s m lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload
app = vbussed (Proxy :: _ UIEvents) $ lcmap halways \push event -> do
  D.div_
    [ D.p_
        [ text_
            """Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load."""
        ]
    , D.button
        (click_ (bang push.buttonClicked))
        [ text_ "Click" ]
    , D.div_
        [ text
            ( bang "Val: 0" <|>
                ( append "Val: " <<< show
                    <$> fold
                      (const (add 1))
                      (bang unit <|> event.buttonClicked)
                      (-1)
                )
            )
        ]
    , D.div_
        [ D.input
            (slider (bang push.sliderMoved))
            []
        , D.div_
            [ text
                ( bang "Val: 50" <|>
                    ( map
                        (append "Val: " <<< show)
                        event.sliderMoved
                    )
                )
            ]
        ]
    ]
