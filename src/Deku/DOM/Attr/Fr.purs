module Deku.DOM.Attr.Fr where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fr = Fr

instance Attr RadialGradient_ Fr  String  where
  attr Fr value = unsafeAttribute (  { key: "fr", value: prop' value  } <$ _)
instance Attr RadialGradient_ Fr (Event.Event  String ) where
  attr Fr eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "fr", value: prop' value }


instance Attr everything Fr  Unit  where
  attr Fr _ = unsafeAttribute (  { key: "fr", value: unset'  } <$ _)
instance Attr everything Fr (Event.Event  Unit ) where
  attr Fr eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "fr", value: unset' }
