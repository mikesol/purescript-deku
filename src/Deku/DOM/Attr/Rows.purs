module Deku.DOM.Attr.Rows where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rows = Rows

instance Attr Textarea_ Rows  String  where
  attr Rows value = unsafeAttribute (  
    { key: "rows", value: prop' value  } <$ _)
instance Attr Textarea_ Rows (Event.Event  String ) where
  attr Rows eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "rows", value: prop' value }


instance Attr everything Rows  Unit  where
  attr Rows _ = unsafeAttribute (  { key: "rows", value: unset'  } <$ _)
instance Attr everything Rows (Event.Event  Unit ) where
  attr Rows eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "rows", value: unset' }
