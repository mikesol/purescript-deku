module Deku.DOM.Attr.AttributeType where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeType = AttributeType

instance Attr AnimateTransform_ AttributeType  String  where
  attr AttributeType value = unsafeAttribute $ Left $  
    { key: "attributeType", value: prop' value }
instance Attr AnimateTransform_ AttributeType (Event.Event  String ) where
  attr AttributeType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "attributeType", value: prop' value }


instance Attr everything AttributeType  Unit  where
  attr AttributeType _ = unsafeAttribute $ Left $  
    { key: "attributeType", value: unset' }
instance Attr everything AttributeType (Event.Event  Unit ) where
  attr AttributeType eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "attributeType", value: unset' }
