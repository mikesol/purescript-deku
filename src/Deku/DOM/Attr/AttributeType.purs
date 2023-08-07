module Deku.DOM.Attr.AttributeType where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeType = AttributeType

instance Attr AnimateTransform_ AttributeType  String  where
  attr AttributeType value = unsafeAttribute (  
    { key: "attributeType", value: prop' value  } <$ _)
instance Attr AnimateTransform_ AttributeType (Event.Event  String ) where
  attr AttributeType eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "attributeType", value: prop' value }


instance Attr everything AttributeType  Unit  where
  attr AttributeType _ = unsafeAttribute (  
    { key: "attributeType", value: unset'  } <$ _)
instance Attr everything AttributeType (Event.Event  Unit ) where
  attr AttributeType eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "attributeType", value: unset' }
