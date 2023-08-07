module Deku.DOM.Attr.Cols where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cols = Cols

instance Attr Textarea_ Cols  String  where
  attr Cols value = unsafeAttribute (  
    { key: "cols", value: prop' value  } <$ _)
instance Attr Textarea_ Cols (Event.Event  String ) where
  attr Cols eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "cols", value: prop' value }


instance Attr everything Cols  Unit  where
  attr Cols _ = unsafeAttribute (  { key: "cols", value: unset'  } <$ _)
instance Attr everything Cols (Event.Event  Unit ) where
  attr Cols eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "cols", value: unset' }
