module Deku.DOM.Attr.Required where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Required = Required

instance Attr Input_ Required  String  where
  attr Required value = unsafeAttribute $ Left $  
    { key: "required", value: prop' value }
instance Attr Input_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "required", value: prop' value }


instance Attr Select_ Required  String  where
  attr Required value = unsafeAttribute $ Left $  
    { key: "required", value: prop' value }
instance Attr Select_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "required", value: prop' value }


instance Attr Textarea_ Required  String  where
  attr Required value = unsafeAttribute $ Left $  
    { key: "required", value: prop' value }
instance Attr Textarea_ Required (Event.Event  String ) where
  attr Required eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "required", value: prop' value }


instance Attr everything Required  Unit  where
  attr Required _ = unsafeAttribute $ Left $  
    { key: "required", value: unset' }
instance Attr everything Required (Event.Event  Unit ) where
  attr Required eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "required", value: unset' }
