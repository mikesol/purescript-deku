module Deku.Examples.Docs.Examples.Portals1 where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\), type (/\))
import Data.Typelevel.Num (d0, d1)
import Data.Vec (index, (+>))
import Data.Vec as V
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, plant, portal, switcher, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (Event, bang, bus, fold, mapAccum)

counter :: forall a. Event a → Event (a /\ Int)
counter event = mapAccum f event 0
  where
  f a b = (b + 1) /\ (a /\ b)

main :: Effect Unit
main = runInBody1
  ( bus \push -> lcmap  (bang unit <|> _) \event -> do
      portal
        ( map
            ( \i -> D.video
                (oneOfMap bang [ D.Controls := "true", D.Width := "250" ])
                ( D.source
                    (oneOfMap bang [ D.Src := i, D.Xtype := "video/mp4" ])
                    blank
                )
            )
            ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                +> "https://www.w3schools.com/jsref/movie.mp4"
                +> V.empty
            )
        )
        \v _ -> do
          let
            p0 = index v d0
            p1 = index v d1
            ev = fold (const not) event
            flips = switcher (if _ then p0 else p1) <<< ev
          plant $ D.div_
            [ D.button (bang $ D.OnClick := cb (const $ push unit))
                [ text_ "Switch videos" ]
            , D.div_ [ D.span_ (flips true), D.span_ (flips false) ]
            ]
  )
