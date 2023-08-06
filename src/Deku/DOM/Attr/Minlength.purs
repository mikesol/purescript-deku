module Deku.DOM.Attr.Minlength where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Minlength = Minlength

instance Attr Input_ Minlength  String  where
  attr Minlength value = unsafeAttribute $ Left $  
    { key: "minlength", value: prop' value }
instance Attr Input_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "minlength", value: prop' value }


instance Attr Textarea_ Minlength  String  where
  attr Minlength value = unsafeAttribute $ Left $  
    { key: "minlength", value: prop' value }
instance Attr Textarea_ Minlength (Event.Event  String ) where
  attr Minlength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "minlength", value: prop' value }


instance Attr everything Minlength  Unit  where
  attr Minlength _ = unsafeAttribute $ Left $  
    { key: "minlength", value: unset' }
instance Attr everything Minlength (Event.Event  Unit ) where
  attr Minlength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "minlength", value: unset' }
