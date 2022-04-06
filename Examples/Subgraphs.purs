module Deku.Examples.Docs.Examples.Subgraphs where

import Prelude

import Control.Alt ((<|>))
import Data.Exists (mkExists)
import Data.Filterable (class Filterable, compact, partitionMap)
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
  => (Sgs -> Effect Unit)
  -> Subgraph Sgs Unit event payload
mySub raise Sg0 = mkExists $ SubgraphF \push event ->
  let
    { left, right } = partitionMap identity event
  in
    D.div_
      [ D.div_
          [ D.button
              (pure $ D.OnClick := cb (const $ raise Sg0))
              [ text_ "Send to B" ]
          , D.div_ [ text (map (append "A: " <<< show) (counter left)) ]
          , D.button
              (pure $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to C" ]
          , D.div_ [ text (map (append "C: " <<< show) (counter right)) ]
          , D.hr_ []
          ]
      ]
mySub raise Sg1 = mkExists $ SubgraphF \push event ->
  let
    { left, right } = partitionMap identity event
  in
    D.div_
      [ D.div_
          [ D.button
              (pure $ D.OnClick := cb (const $ raise Sg0))
              [ text_ "Send to A" ]
          , D.div_ [ text (map (append "B: " <<< show) (counter (left))) ]
          , D.button
              (pure $ D.OnClick := cb (const $ push unit))
              [ text_ "Send to D" ]
          , D.div_ [ text (map (append "D: " <<< show) (counter right)) ]
          ]
      ]

main :: Effect Unit
main = Nothing 🚀 \push event ->
  ( pure (Sg0 /\ InsertOrUpdate unit)
      <|> pure (Sg1 /\ InsertOrUpdate unit)
      <|>
        ( compact event # map
            ( case _ of
                Sg0 -> Sg1 /\ InsertOrUpdate unit
                Sg1 -> Sg0 /\ InsertOrUpdate unit
            )
        )
  ) @@ mySub (push <<< Just)