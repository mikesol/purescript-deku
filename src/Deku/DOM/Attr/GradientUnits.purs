module Deku.DOM.Attr.GradientUnits where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientUnits = GradientUnits

instance Attr LinearGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute (  
    { key: "gradientUnits", value: prop' value  } <$ _)
instance Attr LinearGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }


instance Attr RadialGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute (  
    { key: "gradientUnits", value: prop' value  } <$ _)
instance Attr RadialGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }


instance Attr everything GradientUnits  Unit  where
  attr GradientUnits _ = unsafeAttribute (  
    { key: "gradientUnits", value: unset'  } <$ _)
instance Attr everything GradientUnits (Event.Event  Unit ) where
  attr GradientUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "gradientUnits", value: unset' }
