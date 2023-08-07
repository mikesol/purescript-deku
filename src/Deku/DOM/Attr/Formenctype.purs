module Deku.DOM.Attr.Formenctype where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formenctype = Formenctype

instance Attr Button_ Formenctype  String  where
  attr Formenctype value = unsafeAttribute (  
    { key: "formenctype", value: prop' value  } <$ _)
instance Attr Button_ Formenctype (Event.Event  String ) where
  attr Formenctype eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formenctype", value: prop' value }


instance Attr Input_ Formenctype  String  where
  attr Formenctype value = unsafeAttribute (  
    { key: "formenctype", value: prop' value  } <$ _)
instance Attr Input_ Formenctype (Event.Event  String ) where
  attr Formenctype eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formenctype", value: prop' value }


instance Attr everything Formenctype  Unit  where
  attr Formenctype _ = unsafeAttribute (  
    { key: "formenctype", value: unset'  } <$ _)
instance Attr everything Formenctype (Event.Event  Unit ) where
  attr Formenctype eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "formenctype", value: unset' }
