module Deku.DOM.Attr.Low where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Low = Low

instance Attr Meter_ Low  String  where
  attr Low value = unsafeAttribute $ Left $  { key: "low", value: prop' value }
instance Attr Meter_ Low (Event.Event  String ) where
  attr Low eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "low", value: prop' value }


instance Attr everything Low  Unit  where
  attr Low _ = unsafeAttribute $ Left $  { key: "low", value: unset' }
instance Attr everything Low (Event.Event  Unit ) where
  attr Low eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "low", value: unset' }
