module Deku.Examples.Docs.Examples.Portals where

import Prelude

import Control.Alt ((<|>))
import Data.Exists (mkExists)
import Data.Hashable (class Hashable, hash)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Attribute, cb, (:=))
import Deku.Control (flatten, text_)
import Deku.Core (Element, Subgraph, SubgraphF(..))
import Deku.DOM as D
import Deku.Portal (portal)
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
  :: forall env event payload
   . IsEvent event => event Boolean
  -> (event Boolean -> Element event payload)
  -> (event Boolean -> Element event payload)
  -> Subgraph Sgs env event payload
mySub event gateway0 gateway1 sg = mkExists $ SubgraphF \_ _ -> D.div_
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

img0' :: forall event. Applicative event => event (Attribute D.Img_)
img0' = pure $ D.Src := "https://picsum.photos/200"
img1' :: forall event. Applicative event => event (Attribute D.Img_)
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
        ]