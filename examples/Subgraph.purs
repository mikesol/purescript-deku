module Deku.Example.Docs.Example.Subgraph where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Hashable (class Hashable, hash)
import Data.Map (insert, singleton)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange_)
import Deku.Control.Functions (iloop, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, root, xsubgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (class DOMInterpret, makeFFIDOMSnapshot)
import Deku.Run (defaultOptions, run)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM (Element)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

data Sgs = Sg0 | Sg1
derive instance Eq Sgs
derive instance Ord Sgs
instance Show Sgs where
  show Sg0 = "Sg0"
  show Sg1 = "Sg1"
instance Hashable Sgs where
  hash = show >>> hash

sub :: (Sgs -> Effect Unit) -> SubgraphSig Sgs "div" Unit Unit
sub raise Sg0 =
  ( \_ push ->
      ( icreate $ S.div []
          ( { div1: D.div []
                { button0: D.button
                    [ D.OnClick := Cb (const $ raise Sg0)
                    ]
                    (S.text "Send to B")
                , count0: D.div [] (S.text ("A: 0"))
                , button1: D.button
                    [ D.OnClick := Cb (const $ push unit)
                    ]
                    (S.text "Send to C")
                , count1: D.div [] (S.text ("C: 0"))
                }
            , hr: D.hr [] {}
            }
          )
      ) $> (0 /\ 0)
  ) @!> iloop \e _ (a /\ c) -> case e of
    Left _ ->
      let
        new = (a + 1) /\ c
      in
        ichange_
          { "div.div1.count0.t": "A: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = a /\ (c + 1)
      in
        ichange_
          { "div.div1.count1.t": "C: " <> show (snd new)
          } $> new
sub raise Sg1 =
  ( \_ push ->
      ( icreate $ S.div []
          ( { div1: D.div []
                { button0: D.a
                    [ D.OnClick := Cb (const $ raise Sg1)
                    , D.Style := "cursor:pointer;"

                    ]
                    (S.text "Send to A")
                , count0: D.div [] (S.text "B: 0")
                , button1: D.a
                    [ D.OnClick := Cb (const $ push unit)
                    , D.Style := "cursor:pointer;"

                    ]
                    (S.text "Send to D")
                , count1: D.div [] (S.text "D: 0")
                }
            }
          )
      ) $> (0 /\ 0)
  ) @!> iloop \e _ (b /\ d) -> case e of
    Left _ ->
      let
        new = (b + 1) /\ d
      in
        ichange_
          { "div.div1.count0.t": "B: " <> show (fst new)
          } $> new
    Right _ ->
      let
        new = b /\ (d + 1)
      in
        ichange_
          { "div.div1.count1.t": "D: " <> show (snd new)
          } $> new

scene
  :: forall env dom engine res
   . Monoid res
  => DOMInterpret dom engine
  => Element
  -> Scene env dom engine Frame0 Sgs res
scene elt =
  ( \_ push ->
      ( icreate $ root elt
          { sub:
              D.subgraph
                ( insert Sg0 (pure unit)
                    $ singleton Sg1 (pure unit)
                )
                (AsSubgraph (sub push))
          }

      )
  ) @!> iloop \e _ _ -> case e of
    Left _ -> pure unit
    Right Sg0 -> ichange_
      { "root.sub": xsubgraph (singleton Sg1 (pure unit))
      }
    Right Sg1 -> ichange_
      { "root.sub": xsubgraph (singleton Sg0 (pure unit))
      }

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \elt -> do
    ffi <- makeFFIDOMSnapshot
    subscribe
      ( run (pure unit) (pure unit) defaultOptions ffi
          (scene elt)

      )
      (_.res >>> pure)
