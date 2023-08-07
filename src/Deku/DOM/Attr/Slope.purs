module Deku.DOM.Attr.Slope where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Slope = Slope

instance Attr FeFuncA_ Slope  String  where
  attr Slope value = unsafeAttribute (  
    { key: "slope", value: prop' value  } <$ _)
instance Attr FeFuncA_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr FeFuncB_ Slope  String  where
  attr Slope value = unsafeAttribute (  
    { key: "slope", value: prop' value  } <$ _)
instance Attr FeFuncB_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr FeFuncG_ Slope  String  where
  attr Slope value = unsafeAttribute (  
    { key: "slope", value: prop' value  } <$ _)
instance Attr FeFuncG_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr FeFuncR_ Slope  String  where
  attr Slope value = unsafeAttribute (  
    { key: "slope", value: prop' value  } <$ _)
instance Attr FeFuncR_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "slope", value: prop' value }


instance Attr everything Slope  Unit  where
  attr Slope _ = unsafeAttribute (  { key: "slope", value: unset'  } <$ _)
instance Attr everything Slope (Event.Event  Unit ) where
  attr Slope eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "slope", value: unset' }
