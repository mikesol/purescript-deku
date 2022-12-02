module Deku.Example.Docs.Portals1 where

import Prelude

import Control.Alt (alt)
import Data.FastVect.FastVect ((:), index)
import Data.FastVect.FastVect as V
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (portal, switcher, text_)
import Deku.Core (Nut, dyn, bus, insert_)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..), PageOptions)
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx ((~~))
import Examples as Examples
import FRP.Event (fold)
import Type.Proxy (Proxy(..))
import Web.Event.Event (preventDefault)

data MainUIAction
  = UIShown
  | AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

px =
  Proxy
    :: Proxy
         """<div>
  <h1>Portals</h1>

  <h2>Zapping from place to place</h2>
  <p>
    Sometimes, we have referentially opaque nodes like videos or audio that we can't destroy and recreate when they need to move around the DOM. In these cases, we can use portals to "zap" nodes from one part of the DOM to another.
  </p>

  <p>
    The code below uses portals to flip two videos across a boundary. If you press play on either video, you'll see that it keeps playing uninterrupted, event when it is removed and reinserted.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Events of portals</h2>

  <p>Portals work by sending a referentially-opaque reference to a DOM element into a closure where it can be safely used. Whenever an event is emitted containing the element, the element will be rendered at that place in the DOM, as in the example above. Note that portals "hog the blanket", meaning that they end up in the last place in which they were called.</p>

  <p><code>switcher</code> is a <a href="https://github.com/mikesol/purescript-deku/blob/ff3e2d2dc89b39088c5d5d6ab3492fb8730dd9a4/src/Deku/Control.purs#L325">small function</a> included in Deku to switch between different elements in an enclosure. It's how the tabs in this documentation are implemented as well.</p>

  <h2>Next steps</h2>
  <p>In this section, we used portals to move an element to different areas of the DOM. In the next section, we'll learn how to do <a ~next~ style="cursor:pointer;">static site rendering</a>.</p>
</div>"""

portals1 :: forall r. { | PageOptions r } -> Nut
portals1 options = px ~~
  { code:
      ( D.pre_
          [ D.code_
              [ text_
                  Examples.portals1
              ]
          ]
      )
  , result:
      ( dyn $ bus \push -> lcmap (alt (pure unit))
          \event -> do
            pure $ insert_ $ portal
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
              \(v /\ _) -> do
                let
                  p0 = index (Proxy :: _ 0) v
                  p1 = index (Proxy :: _ 1) v
                  ev i = fold (\a _ -> not a) i event
                  flips = D.span_ <<< pure <<< switcher (if _ then p0 else p1)
                    <<< ev
                D.div_
                  [ D.button (pure $ D.OnClick := cb (const $ push unit))
                      [ text_ "Switch videos" ]
                  , D.div_ [ flips true, flips false ]
                  ]
      )
  , next: oneOfMap pure
      [ D.OnClick :=
          (cb (\e -> preventDefault e *> options.dpage SSR *> scrollToTop))
      , D.Href := (options.slug <> "ssr/")
      ]
  }
