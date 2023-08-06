module Deku.DOM.Attr.Orient where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Orient = Orient

instance Attr Marker_ Orient  String  where
  attr Orient value = unsafeAttribute $ Left $  
    { key: "orient", value: prop' value }
instance Attr Marker_ Orient (Event.Event  String ) where
  attr Orient eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "orient", value: prop' value }


instance Attr everything Orient  Unit  where
  attr Orient _ = unsafeAttribute $ Left $  { key: "orient", value: unset' }
instance Attr everything Orient (Event.Event  Unit ) where
  attr Orient eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "orient", value: unset' }
