module Deku.DOM.Attr.AttributeName where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeName = AttributeName

instance Attr Animate_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ Left $  
    { key: "attributeName", value: prop' value }
instance Attr Animate_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }


instance Attr AnimateMotion_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ Left $  
    { key: "attributeName", value: prop' value }
instance Attr AnimateMotion_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }


instance Attr AnimateTransform_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ Left $  
    { key: "attributeName", value: prop' value }
instance Attr AnimateTransform_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }


instance Attr Set_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ Left $  
    { key: "attributeName", value: prop' value }
instance Attr Set_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }


instance Attr everything AttributeName  Unit  where
  attr AttributeName _ = unsafeAttribute $ Left $  
    { key: "attributeName", value: unset' }
instance Attr everything AttributeName (Event.Event  Unit ) where
  attr AttributeName eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "attributeName", value: unset' }
