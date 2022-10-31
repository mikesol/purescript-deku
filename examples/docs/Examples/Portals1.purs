module Deku.Examples.Docs.Examples.Portals1 where

import Prelude

import Data.FastVect.FastVect (index, (:))
import Data.FastVect.FastVect as V
import Data.Foldable (oneOfMap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Control (portal, switcher, text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Do (useState)
import Deku.Do as Deku
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, fold)
import Type.Prelude (Proxy(..))

main :: Effect Unit
main = runInBody Deku.do
  push /\ event <- useState unit
  portal
    ( map
        ( \i -> D.video
            (oneOfMap pure [ D.Controls := "true", D.Width := "250" ])
            [ D.source
                (oneOfMap pure [ D.Src := i, D.Xtype := "video/mp4" ])
                []
            ]
        )
        ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
            : "https://www.w3schools.com/jsref/movie.mp4"
            : V.empty
        )
    )
    \v _ -> do
      let
        p0 :: Domable _ _
        p0 = index (Proxy :: _ 0) v

        p1 :: Domable _ _
        p1 = index (Proxy :: _ 1) v

        ev :: Boolean -> Event Boolean
        ev b = fold (\a _ -> not a) b event

        flips :: Boolean -> Domable _ _
        flips = D.span_ <<< pure <<< switcher (if _ then p0 else p1) <<< ev
      D.div_
        [ D.button (pure $ D.OnClick := push unit)
            [ text_ "Switch videos" ]
        , D.div_ [ D.span_ [ flips true ], flips false ]
        ]
