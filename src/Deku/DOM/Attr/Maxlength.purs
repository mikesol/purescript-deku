module Deku.DOM.Attr.Maxlength where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Maxlength = Maxlength

instance Attr Input_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute $ Left $  
    { key: "maxlength", value: prop' value }
instance Attr Input_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }


instance Attr Textarea_ Maxlength  String  where
  attr Maxlength value = unsafeAttribute $ Left $  
    { key: "maxlength", value: prop' value }
instance Attr Textarea_ Maxlength (Event.Event  String ) where
  attr Maxlength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }


instance Attr everything Maxlength  Unit  where
  attr Maxlength _ = unsafeAttribute $ Left $  
    { key: "maxlength", value: unset' }
instance Attr everything Maxlength (Event.Event  Unit ) where
  attr Maxlength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "maxlength", value: unset' }
