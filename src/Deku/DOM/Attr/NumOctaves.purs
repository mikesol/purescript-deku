module Deku.DOM.Attr.NumOctaves where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data NumOctaves = NumOctaves

instance Attr FeTurbulence_ NumOctaves  String  where
  attr NumOctaves value = unsafeAttribute (  
    { key: "numOctaves", value: prop' value  } <$ _)
instance Attr FeTurbulence_ NumOctaves (Event.Event  String ) where
  attr NumOctaves eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "numOctaves", value: prop' value }


instance Attr everything NumOctaves  Unit  where
  attr NumOctaves _ = unsafeAttribute (  
    { key: "numOctaves", value: unset'  } <$ _)
instance Attr everything NumOctaves (Event.Event  Unit ) where
  attr NumOctaves eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "numOctaves", value: unset' }
