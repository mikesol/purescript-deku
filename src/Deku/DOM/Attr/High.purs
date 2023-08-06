module Deku.DOM.Attr.High where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data High = High

instance Attr Meter_ High  String  where
  attr High value = unsafeAttribute $ Left $  
    { key: "high", value: prop' value }
instance Attr Meter_ High (Event.Event  String ) where
  attr High eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "high", value: prop' value }


instance Attr everything High  Unit  where
  attr High _ = unsafeAttribute $ Left $  { key: "high", value: unset' }
instance Attr everything High (Event.Event  Unit ) where
  attr High eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "high", value: unset' }
