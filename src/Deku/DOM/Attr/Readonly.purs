module Deku.DOM.Attr.Readonly where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Readonly = Readonly

instance Attr Input_ Readonly  String  where
  attr Readonly value = unsafeAttribute $ Left $  
    { key: "readonly", value: prop' value }
instance Attr Input_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "readonly", value: prop' value }


instance Attr Textarea_ Readonly  String  where
  attr Readonly value = unsafeAttribute $ Left $  
    { key: "readonly", value: prop' value }
instance Attr Textarea_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "readonly", value: prop' value }


instance Attr everything Readonly  Unit  where
  attr Readonly _ = unsafeAttribute $ Left $  
    { key: "readonly", value: unset' }
instance Attr everything Readonly (Event.Event  Unit ) where
  attr Readonly eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "readonly", value: unset' }
