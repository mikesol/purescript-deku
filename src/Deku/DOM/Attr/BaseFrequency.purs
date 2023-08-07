module Deku.DOM.Attr.BaseFrequency where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency  String  where
  attr BaseFrequency value = unsafeAttribute (  
    { key: "baseFrequency", value: prop' value  } <$ _)
instance Attr FeTurbulence_ BaseFrequency (Event.Event  String ) where
  attr BaseFrequency eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "baseFrequency", value: prop' value }


instance Attr everything BaseFrequency  Unit  where
  attr BaseFrequency _ = unsafeAttribute (  
    { key: "baseFrequency", value: unset'  } <$ _)
instance Attr everything BaseFrequency (Event.Event  Unit ) where
  attr BaseFrequency eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "baseFrequency", value: unset' }
