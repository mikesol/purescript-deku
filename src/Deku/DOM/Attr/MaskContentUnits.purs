module Deku.DOM.Attr.MaskContentUnits where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskContentUnits = MaskContentUnits

instance Attr Mask_ MaskContentUnits  String  where
  attr MaskContentUnits value = unsafeAttribute $ Left $  
    { key: "maskContentUnits", value: prop' value }
instance Attr Mask_ MaskContentUnits (Event.Event  String ) where
  attr MaskContentUnits eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "maskContentUnits", value: prop' value }


instance Attr everything MaskContentUnits  Unit  where
  attr MaskContentUnits _ = unsafeAttribute $ Left $  
    { key: "maskContentUnits", value: unset' }
instance Attr everything MaskContentUnits (Event.Event  Unit ) where
  attr MaskContentUnits eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "maskContentUnits", value: unset' }
