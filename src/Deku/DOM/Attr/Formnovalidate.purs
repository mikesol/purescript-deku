module Deku.DOM.Attr.Formnovalidate where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formnovalidate = Formnovalidate

instance Attr Button_ Formnovalidate  String  where
  attr Formnovalidate value = unsafeAttribute (  
    { key: "formnovalidate", value: prop' value  } <$ _)
instance Attr Button_ Formnovalidate (Event.Event  String ) where
  attr Formnovalidate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formnovalidate", value: prop' value }


instance Attr Input_ Formnovalidate  String  where
  attr Formnovalidate value = unsafeAttribute (  
    { key: "formnovalidate", value: prop' value  } <$ _)
instance Attr Input_ Formnovalidate (Event.Event  String ) where
  attr Formnovalidate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "formnovalidate", value: prop' value }


instance Attr everything Formnovalidate  Unit  where
  attr Formnovalidate _ = unsafeAttribute (  
    { key: "formnovalidate", value: unset'  } <$ _)
instance Attr everything Formnovalidate (Event.Event  Unit ) where
  attr Formnovalidate eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "formnovalidate", value: unset' }
