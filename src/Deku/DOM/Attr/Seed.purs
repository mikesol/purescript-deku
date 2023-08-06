module Deku.DOM.Attr.Seed where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Seed = Seed

instance Attr FeTurbulence_ Seed  String  where
  attr Seed value = unsafeAttribute $ Left $  
    { key: "seed", value: prop' value }
instance Attr FeTurbulence_ Seed (Event.Event  String ) where
  attr Seed eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "seed", value: prop' value }


instance Attr everything Seed  Unit  where
  attr Seed _ = unsafeAttribute $ Left $  { key: "seed", value: unset' }
instance Attr everything Seed (Event.Event  Unit ) where
  attr Seed eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "seed", value: unset' }
