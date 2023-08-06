module Deku.DOM.Attr.Autocomplete where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autocomplete = Autocomplete

instance Attr Form_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ Left $  
    { key: "autocomplete", value: prop' value }
instance Attr Form_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }


instance Attr Input_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ Left $  
    { key: "autocomplete", value: prop' value }
instance Attr Input_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }


instance Attr Select_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ Left $  
    { key: "autocomplete", value: prop' value }
instance Attr Select_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }


instance Attr Textarea_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute $ Left $  
    { key: "autocomplete", value: prop' value }
instance Attr Textarea_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }


instance Attr everything Autocomplete  Unit  where
  attr Autocomplete _ = unsafeAttribute $ Left $  
    { key: "autocomplete", value: unset' }
instance Attr everything Autocomplete (Event.Event  Unit ) where
  attr Autocomplete eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "autocomplete", value: unset' }
