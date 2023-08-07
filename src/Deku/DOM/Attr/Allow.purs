module Deku.DOM.Attr.Allow where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Allow = Allow

instance Attr Iframe_ Allow  String  where
  attr Allow value = unsafeAttribute (  
    { key: "allow", value: prop' value  } <$ _)
instance Attr Iframe_ Allow (Event.Event  String ) where
  attr Allow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "allow", value: prop' value }


instance Attr everything Allow  Unit  where
  attr Allow _ = unsafeAttribute (  { key: "allow", value: unset'  } <$ _)
instance Attr everything Allow (Event.Event  Unit ) where
  attr Allow eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "allow", value: unset' }
