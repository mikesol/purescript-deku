module Deku.Example.Docs.Subgraphs where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (class Plus)
import Data.Exists (mkExists)
import Data.Filterable (class Filterable, compact, filterMap)
import Data.Hashable (class Hashable, hash)
import Data.Maybe (Maybe(..))
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text, text_)
import Deku.Core (Element, Subgraph, SubgraphF(..))
import Deku.DOM as D
import Deku.Example.Docs.Types (Page(..))
import Deku.Example.Docs.Util (scrollToTop)
import Deku.Pursx (nut, (~~))
import Deku.Subgraph (SubgraphAction(..), (@@))
import Effect (Effect)
import FRP.Event (class IsEvent, mapAccum)
import FRP.Event.Class (bang)
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

counter :: forall event a. IsEvent event => event a → event Int
counter event = map snd $ mapAccum f event 0
  where
  f a b = (b + 1) /\ (a /\ b)

mySub
  :: forall event payload
   . Filterable event
  => IsEvent event
  => event Sgs
  -> (Sgs -> Effect Unit)
  -> Subgraph Sgs event payload
mySub oevent raise Sg0 = mkExists $ SubgraphF \push event ->
  let
    left = filterMap
      ( case _ of
          Sg0 -> Nothing
          Sg1 -> Just unit
      )
      oevent
    right = event
  in
    D.div_
      [ D.div_
          [ D.button
              (bang $ D.OnClick := cb (const $ raise Sg0))
              [ text_ "Send to B" ]
          , D.div_ [ text (map (append "A: " <<< show)
                      (counter (left <|> bang unit))) ]
          , D.button
              (bang $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to C" ]
          , D.div_ [ text (map (append "C: " <<< show)
                      (counter (right <|> bang unit))) ]
          , D.hr_ []
          ]
      ]
mySub oevent raise Sg1 = mkExists $ SubgraphF \push event ->
  let
    left = filterMap
      ( case _ of
          Sg0 -> Just unit
          Sg1 -> Nothing
      )
      oevent
    right = event
  in
    D.div_
      [ D.div_
          [ D.button
              (bang $ D.OnClick := cb (const $ raise Sg1))
              [ text_ "Send to A" ]
          , D.div_ [ text (map (append "B: " <<< show)
                      (counter (left <|> bang unit))) ]
          , D.button
              (bang $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to D" ]
          , D.div_ [ text (map (append "D: " <<< show)
                      (counter (right <|> bang unit))) ]
          ]
      ]

px =  Proxy :: Proxy """<div>
  <h1>Subgraphs</h1>

  <h2>Inter-component communication</h2>
  <p>
    As your app gets larger, you'll want to split up your code into logical components. Besides making the code easier to work with, in Deku, this allows us to change child components on the fly without changing the type of the parent graph. We call these subgraphs.</p>

  <p>In the code below, two subgraphs are divided by a horizontal line. They communicate with each other via message passing, and they also have internal messaging.</p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Subgraph anatomy</h2>

  <p>Subgraphs are not unlike the root components we've been working with all along. There are, however, a few key differences to be aware of.</p>

  <h3>The event</h3>

  <code>Subgraph</code>-s, like <code>Element</code>-s, receive an <code>Event</code> as their first arguemnt. However, unlike <code>Element</code>-s, this <code>Event</code> contains a <code>Tuple</code> of shape <code>Tuple index SubgraphAction</code>.

  The first part of the <code>Tuple</code> is the index of the subgraph. Each subgraph has a unique hashable index.

  The second part of the <code>Tuple</code> is a <code>SubgraphAction</code>, which is one of the three following things:

  <ul>
    <li><code>Insert</code>: Inserts or updates a subgraph. Multiple inserts to the same index are a no-op.</li>
    <li><code>SendToTop</code>: Sends the subgraph to the top of its enclosing element. Note that, if the enclosing element contains other elements besides the subgraph, it will leapfrog those as well, which is not what you want in most cases. To avoid this, as standard practice, a subgraph should be the unique child of its enclosing element.</li>
    <li><code>Remove</code>: Remove a subgraph from the DOM.</li>
  </ul>

  <h3>The creation function</h3>
  The second and last argument to <code>subgraph</code> is the subgraph creation function. This takes three arguments:

  <ul>
    <li>The index of this particular subgraph</li>
    <li>A pusher for this subgraph. Things pushed to this pusher will be propagated <i>only</i> to this particular subgraph, meaning its parent and its siblings will not receive these pushes.</li>
    <li>An event of type <code>Event push</code>. This event is wired up to the subgraph's pusher.</li>
  </ul>

  <p>Note that the last two arguments, the <i>pusher</i> and the <i>event</i>, are part of an existential type and <i>must</i> come after a call to <code>mkExists</code> followed by the <code>newtype</code> constructor <code>SubgraphF</code>, as seen in the example above. This pattern allows you to have arbitrary pushers for each subgraph.</p>

  <p>Using this pattern, you can create the behavior of dynamic websites with little or no overhead. For example, the navigation links on this page are implemented as subgraph, and as you can see, they are quite fast!</p>

  <h2>Next steps</h2>
  <p>Subgraphs are a great way to bring elements in and out of the DOM, but what if you want to take an existing element and ship it somewhere else? In these cases, the best bet is often to use CSS, but if CSS won't cut it, there are <a ~next~ style="cursor:pointer;">portals</a>.</p>
</div>"""

subgraphs :: forall event payload. IsEvent event => Plus event => (Page -> Effect Unit) -> Element event payload
subgraphs dpage = px ~~
  { code: nut
      ( D.pre_
          [ D.code_
              [ text_
                  """module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Exists (mkExists)
import Data.Filterable (class Filterable, compact, filterMap)
import Data.Hashable (class Hashable, hash)
import Data.Maybe (Maybe(..))
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text, text_)
import Deku.Core (Subgraph, SubgraphF(..))
import Deku.DOM as D
import Deku.Subgraph (SubgraphAction(..), (@@))
import Deku.Toplevel ((🚀))
import Effect (Effect)
import FRP.Event (class IsEvent, mapAccum)
import FRP.Event.Class (bang)

data UIevents = UIShown | ButtonClicked | SliderMoved Number
derive instance Eq UIevents

data Sgs = Sg0 | Sg1
derive instance Eq Sgs
derive instance Ord Sgs
instance Show Sgs where
  show Sg0 = "Sg0"
  show Sg1 = "Sg1"
instance Hashable Sgs where
  hash = show >>> hash

counter :: forall event a. IsEvent event => event a → event Int
counter event = map snd $ mapAccum f event 0
  where
  f a b = (b + 1) /\ (a /\ b)

mySub
  :: forall event payload
   . Filterable event
  => IsEvent event
  => event Sgs
  -> (Sgs -> Effect Unit)
  -> Subgraph Sgs event payload
mySub oevent raise Sg0 = mkExists $ SubgraphF \push event ->
  let
    left = filterMap
      ( case _ of
          Sg0 -> Nothing
          Sg1 -> Just unit
      )
      oevent
    right = event
  in
    D.div_
      [ D.div_
          [ D.button
              (bang $ D.OnClick := cb (const $ raise Sg0))
              [ text_ "Send to B" ]
          , D.div_ [ text (map (append "A: " <<< show)
                      (counter (left <|> bang unit))) ]
          , D.button
              (bang $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to C" ]
          , D.div_ [ text (map (append "C: " <<< show)
                      (counter (right <|> bang unit))) ]
          , D.hr_ []
          ]
      ]
mySub oevent raise Sg1 = mkExists $ SubgraphF \push event ->
  let
    left = filterMap
      ( case _ of
          Sg0 -> Just unit
          Sg1 -> Nothing
      )
      oevent
    right = event
  in
    D.div_
      [ D.div_
          [ D.button
              (bang $ D.OnClick := cb (const $ raise Sg1))
              [ text_ "Send to A" ]
          , D.div_ [ text (map (append "B: " <<< show)
                      (counter (left <|> bang unit))) ]
          , D.button
              (bang $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to D" ]
          , D.div_ [ text (map (append "D: " <<< show)
                      (counter (right <|> bang unit))) ]
          ]
      ]

main :: Effect Unit
main = Nothing 🚀 \push event ->
  ( bang (Sg0 /\ Insert) <|> bang (Sg1 /\ Insert)
  ) @@ mySub (compact event) (push <<< Just)"""
              ]
          ]
      )
  , result: nut
      ( bang (unit /\ Insert) @@ \_ -> mkExists $ SubgraphF \push event ->
            ( bang (Sg0 /\ Insert)
                <|> bang (Sg1 /\ Insert)
            ) @@ mySub (compact event) (push <<< Just)
      )
  , next: bang (D.OnClick := (cb (const $ dpage Portals *> scrollToTop)))
  }