module Deku.DOM.Attr.Low where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Low = Low

instance Attr Meter_ Low  String  where
  attr Low value = unsafeAttribute (  { key: "low", value: prop' value  } <$ _)
instance Attr Meter_ Low (Event.Event  String ) where
  attr Low eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "low", value: prop' value }


instance Attr everything Low  Unit  where
  attr Low _ = unsafeAttribute (  { key: "low", value: unset'  } <$ _)
instance Attr everything Low (Event.Event  Unit ) where
  attr Low eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "low", value: unset' }
