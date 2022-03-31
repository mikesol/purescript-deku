module Deku.Example.Docs.Portals where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (class Plus)
import Data.Either (hush)
import Data.Filterable (compact)
import Data.Hashable (class Hashable, hash)
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (flatten, text_)
import Deku.Core (Element, Element, Subgraph)
import Deku.DOM as D
import Deku.Example.Docs.Types (Page)
import Deku.Portal (portal)
import Deku.Pursx (nut, (~~))
import Deku.Subgraph (SubgraphAction(..), (@@))
import Effect (Effect)
import FRP.Event (class IsEvent, Event, mapAccum)
import Type.Proxy (Proxy(..))

data UIEvents = UIShown | ButtonClicked | SliderMoved Number
derive instance Eq UIEvents

data Sgs = Sg0 | Sg1
derive instance Eq Sgs
derive instance Ord Sgs
instance Show Sgs where
  show Sg0 = "Sg0"
  show Sg1 = "Sg1"
instance Hashable Sgs where
  hash = show >>> hash

counter :: forall a. Event a → Event Int
counter event = map snd $ mapAccum f event 0
  where
  f a b = (b + 1) /\ (a /\ b)


mySub
  :: forall env push event payload
   . IsEvent event => event Boolean
  -> (event Boolean -> Element event payload)
  -> (event Boolean -> Element event payload)
  -> Subgraph Sgs env push event payload
mySub event gateway0 gateway1 sg _ _ = D.div_
  [ gateway0
      ( map
          ( case sg of
              Sg0 -> identity
              Sg1 -> not
          )
          event
      )
  , gateway1
      ( map
          ( case sg of
              Sg0 -> not
              Sg1 -> identity
          )
          event
      )
  ]

px =  Proxy :: Proxy """<div>
  <h1>Portals</h1>

  <h2>Sending elements to distant lands</h2>
  <p>
    There are several common cases where you'll need to send part of the DOM from one location to another. These include:</p>
  <ul>
    <li>Videos that pop out to the side as a user scrolls.</li>
    <li>Drag and drop.</li>
    <li>Online HTML and SVG editors where elements need to change parents.</li>
  </ul>
  <p>In these cases, you can use portals to ship part of the DOM from one destination to another. In the code below, a portal containing an image is shifted between two subgraphs.</p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>The anatomy of a portal</h2>

  <p>The <code>portal</code> function takes two arguments</p>

  <ul>
    <li><code>element</code> - the element that comprises the portal</li>
    <li><code>continuation</code> - a function yielding element that potentially uses the portal</li>
  </ul>
  <p>The element yielded by the continuation will be displayed on the screen.</p>
  <p>The continuation takes one argument: an <code>event Boolean</code> that indicates whether or not to display the portal. The portal will jump to whichever place in the DOM yielded true most recently. Be careful - you must send at least one true event to see your portal!</p>
  <h2>Parting shot</h2>
  <p>Thanks for checking out Deku! I had a blast writing it, I hope you have fun using it too 😊</p>
</div>"""

portals :: forall event payload. IsEvent event => Plus event => (Page -> Effect Unit) -> Element event payload
portals dpage = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Deku.Examples.Docs.Examples.Portals where

import Prelude

import Control.Alt ((<|>))
import Data.Hashable (class Hashable, hash)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Attribute, cb, (:=))
import Deku.Control (flatten, text_)
import Deku.Core (Element, Subgraph)
import Deku.DOM as D
import Deku.Portal (GatewayToSubgraph, portal)
import Deku.Subgraph (SubgraphAction(..), (@@))
import Deku.Toplevel ((🚀))
import Effect (Effect)
import FRP.Event (class IsEvent)

data UIEvents = UIShown | ButtonClicked | SliderMoved Number
derive instance Eq UIEvents

data Sgs = Sg0 | Sg1
derive instance Eq Sgs
derive instance Ord Sgs
instance Show Sgs where
  show Sg0 = "Sg0"
  show Sg1 = "Sg1"
instance Hashable Sgs where
  hash = show >>> hash

mySub
  :: forall env push event payload
   . Event Boolean
  -> (Event Boolean -> Element event payload)
  -> (Event Boolean -> Element event payload)
  -> Subgraph Sgs env push event payload
mySub event gateway0 gateway1 sg _ _ = D.div_
  [ gateway0
      ( map
          ( case sg of
              Sg0 -> identity
              Sg1 -> not
          )
          event
      )
  , gateway1
      ( map
          ( case sg of
              Sg0 -> not
              Sg1 -> identity
          )
          event
      )
  ]

img0' :: Event (Attribute D.Img_)
img0' = pure $ D.Src := "https://picsum.photos/200"
img1' :: Event (Attribute D.Img_)
img1' = pure $ D.Src := "https://picsum.photos/300"

main :: Effect Unit
main = false 🚀 \push event ->
  portal (D.img img0' []) \img0 ->
    portal (D.img img1' []) \img1 ->
      let eventBool = event <|> pure false in
      flatten
        [ ( pure (Sg0 /\ InsertOrUpdate unit)
              <|> pure (Sg1 /\ InsertOrUpdate unit)
          ) @@ mySub eventBool img0 img1
        , D.button (map (\e -> D.OnClick :=
        cb (const (push $ not e))) eventBool)
            [ text_ "Shift images between portals" ]
        ]"""
              ]
          ]
      )
  , result: nut
      ( pure (unit /\ InsertOrUpdate unit) @@ \_ push event' ->
          let
            event = compact (map hush event')
          in
            portal (D.img (pure $ D.Src := "https://picsum.photos/200") []) \img0 ->
    portal (D.img (pure $ D.Src := "https://picsum.photos/300") []) \img1 ->
      let eventBool = event <|> pure false in
      flatten
        [ ( pure (Sg0 /\ InsertOrUpdate unit)
              <|> pure (Sg1 /\ InsertOrUpdate unit)
          ) @@ mySub eventBool img0 img1
        , D.button (map (\e -> D.OnClick := cb (const (push $ not e))) eventBool)
            [ text_ "Shift images between portals" ]
        ]
      )
  }