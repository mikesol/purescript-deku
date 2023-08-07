module Deku.DOM.Attr.Hreflang where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Hreflang = Hreflang

instance Attr A_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute (  
    { key: "hreflang", value: prop' value  } <$ _)
instance Attr A_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "hreflang", value: prop' value }


instance Attr Area_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute (  
    { key: "hreflang", value: prop' value  } <$ _)
instance Attr Area_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "hreflang", value: prop' value }


instance Attr Link_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute (  
    { key: "hreflang", value: prop' value  } <$ _)
instance Attr Link_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "hreflang", value: prop' value }


instance Attr everything Hreflang  Unit  where
  attr Hreflang _ = unsafeAttribute (  
    { key: "hreflang", value: unset'  } <$ _)
instance Attr everything Hreflang (Event.Event  Unit ) where
  attr Hreflang eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "hreflang", value: unset' }
