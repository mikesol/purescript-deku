module Deku.DOM.Attr.Side where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Side = Side

instance Attr TextPath_ Side  String  where
  attr Side value = unsafeAttribute (  
    { key: "side", value: prop' value  } <$ _)
instance Attr TextPath_ Side (Event.Event  String ) where
  attr Side eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "side", value: prop' value }


instance Attr everything Side  Unit  where
  attr Side _ = unsafeAttribute (  { key: "side", value: unset'  } <$ _)
instance Attr everything Side (Event.Event  Unit ) where
  attr Side eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "side", value: unset' }
