module Deku.Examples.Docs.Examples.Subgraphs where

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
          , D.div_ [ text (map (append "A: " <<< show) (counter (left <|> bang unit))) ]
          , D.button
              (bang $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to C" ]
          , D.div_ [ text (map (append "C: " <<< show) (counter (right <|> bang unit))) ]
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
          , D.div_ [ text (map (append "B: " <<< show) (counter (left <|> bang unit))) ]
          , D.button
              (bang $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to D" ]
          , D.div_ [ text (map (append "D: " <<< show) (counter (right <|> bang unit))) ]
          ]
      ]

main :: Effect Unit
main = Nothing 🚀 \push event ->
  ( bang (Sg0 /\ Insert) <|> bang (Sg1 /\ Insert)
  ) @@ mySub (compact event) (push <<< Just)