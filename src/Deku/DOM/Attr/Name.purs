module Deku.DOM.Attr.Name where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Map (Map_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Param (Param_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Name = Name

instance Attr Button_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Button_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Form_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Form_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Fieldset_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Fieldset_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Iframe_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Iframe_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Input_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Input_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Object_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Object_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Output_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Output_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Select_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Select_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Textarea_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Textarea_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Map_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Map_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Meta_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Meta_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr Param_ Name  String  where
  attr Name value = unsafeAttribute (  
    { key: "name", value: prop' value  } <$ _)
instance Attr Param_ Name (Event.Event  String ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "name", value: prop' value }


instance Attr everything Name  Unit  where
  attr Name _ = unsafeAttribute (  { key: "name", value: unset'  } <$ _)
instance Attr everything Name (Event.Event  Unit ) where
  attr Name eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "name", value: unset' }
