module Deku.DOM.Attr.Fx where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fx = Fx

instance Attr RadialGradient_ Fx  String  where
  attr Fx value = unsafeAttribute (  { key: "fx", value: prop' value  } <$ _)
instance Attr RadialGradient_ Fx (Event.Event  String ) where
  attr Fx eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "fx", value: prop' value }


instance Attr everything Fx  Unit  where
  attr Fx _ = unsafeAttribute (  { key: "fx", value: unset'  } <$ _)
instance Attr everything Fx (Event.Event  Unit ) where
  attr Fx eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "fx", value: unset' }
