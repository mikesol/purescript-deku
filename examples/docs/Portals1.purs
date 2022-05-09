module Deku.Example.Docs.Portals1 where

import Prelude

import Control.Alt (alt)
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Data.FastVect.FastVect ((:), index)
import Data.FastVect.FastVect as V
import Deku.Attribute (cb, (:=))
import Deku.Control (portal, switcher, text_)
import Deku.Core (Child(..), Domable, Element, dyn)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Pursx (nut, (~~))
import Effect (Effect)
import FRP.Event (bang, bus, fold)
import Type.Proxy (Proxy(..))

data MainUIAction
  = UIShown
  | AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

px =
  Proxy    :: Proxy      """<div>
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

  <h2>Parting shot</h2>
  <p>Thanks for checking out Deku! I had a blast writing it, and I hope you enjoy using it for your projects!</p>
</div>"""



portals1 :: forall lock payload. (Page -> Effect Unit) -> Domable Effect lock payload
portals1 _ = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\), type (/\))
import Data.FastVect.FastVect (index, (:))
import Data.FastVect.FastVect as V
import Deku.Attribute ((:=))
import Deku.Control (blank, plant, portal, switcher, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (Event, bang, bus, fold, mapAccum)
import Type.Prelude (Proxy(..))

counter :: forall a. Event a → Event (a /\ Int)
counter event = mapAccum f event 0
  where
  f a b = (b + 1) /\ (a /\ b)

main :: Effect Unit
main = runInBody1
  ( bus \push -> lcmap  (bang unit <|> _) \event -> do
      plant $ portal
        ( map
            ( \i -> D.video
                (oneOfMap bang [ D.Controls := "true", D.Width := "250" ])
                ( D.source
                    (oneOfMap bang [ D.Src := i, D.Xtype := "video/mp4" ])
                    blank
                )
            )
            ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                : "https://www.w3schools.com/jsref/movie.mp4"
                : V.empty
            )
        )
        \v _ -> do
          let
            p0 = index (Proxy :: _ 0) v
            p1 = index (Proxy :: _ 1) v
            ev = fold (const not) event
            flips = switcher (if _ then p0 else p1) <<< ev
          plant $ D.div_
            [ D.button (bang $ D.OnClick := push unit)
                [ text_ "Switch videos" ]
            , D.div_ [ D.span_ (flips true), D.span_ (flips false) ]
            ]
  )
"""
              ]
          ]
      )
  , result: nut

   ( dyn $ bus \push -> lcmap (alt (bang unit)) \event -> do
      bang $ Insert $ portal
        ( map
            ( \i -> D.video
                (oneOfMap bang [ D.Controls := "true", D.Width := "250" ])
                [D.source
                    (oneOfMap bang [ D.Src := i, D.Xtype := "video/mp4" ])
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
            p0 = index (Proxy :: _ 0) v
            p1 = index (Proxy :: _ 1) v
            ev = fold (const not) event
            flips = switcher (if _ then p0 else p1) <<< ev
          D.div_
            [ D.button (bang $ D.OnClick := cb (const $ push unit))
                [ text_ "Switch videos" ]
            , D.div_ [ D.span_ [flips true], D.span_ [flips false] ]
            ]
  )
  }
