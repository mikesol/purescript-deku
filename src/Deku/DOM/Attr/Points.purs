module Deku.DOM.Attr.Points where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Points = Points

instance Attr Polygon_ Points  String  where
  attr Points value = unsafeAttribute $ Left $  
    { key: "points", value: prop' value }
instance Attr Polygon_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "points", value: prop' value }


instance Attr Polyline_ Points  String  where
  attr Points value = unsafeAttribute $ Left $  
    { key: "points", value: prop' value }
instance Attr Polyline_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "points", value: prop' value }


instance Attr everything Points  Unit  where
  attr Points _ = unsafeAttribute $ Left $  { key: "points", value: unset' }
instance Attr everything Points (Event.Event  Unit ) where
  attr Points eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "points", value: unset' }
