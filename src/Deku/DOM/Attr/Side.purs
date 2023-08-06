module Deku.DOM.Attr.Side where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Side = Side

instance Attr TextPath_ Side  String  where
  attr Side value = unsafeAttribute $ Left $  
    { key: "side", value: prop' value }
instance Attr TextPath_ Side (Event.Event  String ) where
  attr Side eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "side", value: prop' value }


instance Attr everything Side  Unit  where
  attr Side _ = unsafeAttribute $ Left $  { key: "side", value: unset' }
instance Attr everything Side (Event.Event  Unit ) where
  attr Side eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "side", value: unset' }
