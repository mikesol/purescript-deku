module Deku.DOM.Attr.Autocomplete where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Autocomplete = Autocomplete
instance Attr Form_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute (  
    { key: "autocomplete", value: prop' value  } <$ _)
instance Attr Form_ Autocomplete (Event.Event Unit -> Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute (map (map (
    \value -> { key: "autocomplete", value: prop' value })) eventValue)
instance Attr Form_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }
instance Attr Input_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute (  
    { key: "autocomplete", value: prop' value  } <$ _)
instance Attr Input_ Autocomplete (Event.Event Unit -> Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute (map (map (
    \value -> { key: "autocomplete", value: prop' value })) eventValue)
instance Attr Input_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }
instance Attr Select_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute (  
    { key: "autocomplete", value: prop' value  } <$ _)
instance Attr Select_ Autocomplete (Event.Event Unit -> Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute (map (map (
    \value -> { key: "autocomplete", value: prop' value })) eventValue)
instance Attr Select_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }
instance Attr Textarea_ Autocomplete  String  where
  attr Autocomplete value = unsafeAttribute (  
    { key: "autocomplete", value: prop' value  } <$ _)
instance Attr Textarea_ Autocomplete (Event.Event Unit -> Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute (map (map (
    \value -> { key: "autocomplete", value: prop' value })) eventValue)
instance Attr Textarea_ Autocomplete (Event.Event  String ) where
  attr Autocomplete eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autocomplete", value: prop' value }
instance Attr everything Autocomplete  Unit  where
  attr Autocomplete _ = unsafeAttribute (  
    { key: "autocomplete", value: unset'  } <$ _)
instance Attr everything Autocomplete (Event.Event Unit -> Event.Event  Unit ) where
  attr Autocomplete eventValue = unsafeAttribute (map (map (
    \_ -> { key: "autocomplete", value: unset' })) eventValue)
instance Attr everything Autocomplete (Event.Event  Unit ) where
  attr Autocomplete eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "autocomplete", value: unset' }