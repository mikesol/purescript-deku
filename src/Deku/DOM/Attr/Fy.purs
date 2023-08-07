module Deku.DOM.Attr.Fy where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fy = Fy

instance Attr RadialGradient_ Fy  String  where
  attr Fy value = unsafeAttribute (  { key: "fy", value: prop' value  } <$ _)
instance Attr RadialGradient_ Fy (Event.Event  String ) where
  attr Fy eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "fy", value: prop' value }


instance Attr everything Fy  Unit  where
  attr Fy _ = unsafeAttribute (  { key: "fy", value: unset'  } <$ _)
instance Attr everything Fy (Event.Event  Unit ) where
  attr Fy eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "fy", value: unset' }
