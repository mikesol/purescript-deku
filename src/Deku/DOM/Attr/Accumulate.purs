module Deku.DOM.Attr.Accumulate where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accumulate = Accumulate

instance Attr Animate_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute (  
    { key: "accumulate", value: prop' value  } <$ _)
instance Attr Animate_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "accumulate", value: prop' value }


instance Attr AnimateMotion_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute (  
    { key: "accumulate", value: prop' value  } <$ _)
instance Attr AnimateMotion_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "accumulate", value: prop' value }


instance Attr AnimateTransform_ Accumulate  String  where
  attr Accumulate value = unsafeAttribute (  
    { key: "accumulate", value: prop' value  } <$ _)
instance Attr AnimateTransform_ Accumulate (Event.Event  String ) where
  attr Accumulate eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "accumulate", value: prop' value }


instance Attr everything Accumulate  Unit  where
  attr Accumulate _ = unsafeAttribute (  
    { key: "accumulate", value: unset'  } <$ _)
instance Attr everything Accumulate (Event.Event  Unit ) where
  attr Accumulate eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "accumulate", value: unset' }
