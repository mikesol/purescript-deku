module Deku.DOM.Attr.Sandbox where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox  String  where
  attr Sandbox value = unsafeAttribute (  
    { key: "sandbox", value: prop' value  } <$ _)
instance Attr Iframe_ Sandbox (Event.Event  String ) where
  attr Sandbox eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "sandbox", value: prop' value }


instance Attr everything Sandbox  Unit  where
  attr Sandbox _ = unsafeAttribute (  { key: "sandbox", value: unset'  } <$ _)
instance Attr everything Sandbox (Event.Event  Unit ) where
  attr Sandbox eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "sandbox", value: unset' }
