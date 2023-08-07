module Deku.DOM.Attr.Codebase where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Codebase = Codebase

instance Attr Applet_ Codebase  String  where
  attr Codebase value = unsafeAttribute (  
    { key: "codebase", value: prop' value  } <$ _)
instance Attr Applet_ Codebase (Event.Event  String ) where
  attr Codebase eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "codebase", value: prop' value }


instance Attr everything Codebase  Unit  where
  attr Codebase _ = unsafeAttribute (  
    { key: "codebase", value: unset'  } <$ _)
instance Attr everything Codebase (Event.Event  Unit ) where
  attr Codebase eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "codebase", value: unset' }
