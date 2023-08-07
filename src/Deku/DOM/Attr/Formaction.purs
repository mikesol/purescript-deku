module Deku.DOM.Attr.Formaction where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Button (Button_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formaction = Formaction

instance Attr Input_ Formaction  String  where
  attr Formaction value = unsafeAttribute (  
    { key: "formaction", value: prop' value  } <$ _)
instance Attr Input_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formaction", value: prop' value }


instance Attr Button_ Formaction  String  where
  attr Formaction value = unsafeAttribute (  
    { key: "formaction", value: prop' value  } <$ _)
instance Attr Button_ Formaction (Event.Event  String ) where
  attr Formaction eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formaction", value: prop' value }


instance Attr everything Formaction  Unit  where
  attr Formaction _ = unsafeAttribute (  
    { key: "formaction", value: unset'  } <$ _)
instance Attr everything Formaction (Event.Event  Unit ) where
  attr Formaction eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "formaction", value: unset' }
