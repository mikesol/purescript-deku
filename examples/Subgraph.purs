module Deku.Example.Docs.Example.Subgraph where

import Prelude

import Data.Either (Either(..))
import Deku.Toplevel ((🚀))
import Data.Hashable (class Hashable, hash)
import Data.Map (insert, singleton)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Change (change)
import Deku.Control.Functions (u, (%>))
import Deku.Graph.Attribute (cb)
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, xsubgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Effect (Effect)

data Sgs = Sg0 | Sg1
derive instance Eq Sgs
derive instance Ord Sgs
instance Show Sgs where
  show Sg0 = "Sg0"
  show Sg1 = "Sg1"
instance Hashable Sgs where
  hash = show >>> hash

mySub
  :: (Sgs -> Effect Unit)
  -> SubgraphSig Sgs Unit Unit
mySub raise Sg0 =
  ( \_ push ->
      S.div []
        ( { div1: D.div []
              { button0: D.button
                  [ D.OnClick := cb (const $ raise Sg0)
                  ]
                  (S.text "Send to B")
              , count0: D.div [] (S.text ("A: 0"))
              , button1: D.button
                  [ D.OnClick := cb (const $ push unit)
                  ]
                  (S.text "Send to C")
              , count1: D.div [] (S.text ("C: 0"))
              }
          , hr: D.hr [] {}
          }
        )
        /\ (0 /\ 0)
  ) %> \e (a /\ c) -> case e of
    Left _ ->
      let
        new = (a + 1) /\ c
      in
        change
          { "div.div1.count0.t": "A: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = a /\ (c + 1)
      in
        change
          { "div.div1.count1.t": "C: " <> show (snd new)
          } $> new
mySub raise Sg1 =
  ( \_ push ->
      S.div []
        ( { div1: D.div []
              { button0: D.a
                  [ D.OnClick := cb (const $ raise Sg1)
                  , D.Style := "cursor:pointer;"

                  ]
                  (S.text "Send to A")
              , count0: D.div [] (S.text "B: 0")
              , button1: D.a
                  [ D.OnClick := cb (const $ push unit)
                  , D.Style := "cursor:pointer;"

                  ]
                  (S.text "Send to D")
              , count1: D.div [] (S.text "D: 0")
              }
          }
        )
        /\ (0 /\ 0)
  ) %> \e (b /\ d) -> case e of
    Left _ ->
      let
        new = (b + 1) /\ d
      in
        change
          { "div.div1.count0.t": "B: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = b /\ (d + 1)
      in
        change
          { "div.div1.count1.t": "D: " <> show (snd new)
          } $> new

main :: Effect Unit
main =
  ( \push ->
      u $
        { sub:
            D.subgraph
              ( insert Sg0 (pure unit)
                  $ singleton Sg1 (pure unit)
              )
              (AsSubgraph (mySub push))
        }

  ) 🚀 \e _ -> case e of
    Sg0 -> change
      { "root.sub": xsubgraph (singleton Sg1 (pure unit))
      }
    Sg1 -> change
      { "root.sub": xsubgraph (singleton Sg0 (pure unit))
      }
