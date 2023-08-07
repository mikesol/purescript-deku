module Deku.DOM.Attr.Exponent where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Exponent = Exponent

instance Attr FeFuncA_ Exponent  String  where
  attr Exponent value = unsafeAttribute (  
    { key: "exponent", value: prop' value  } <$ _)
instance Attr FeFuncA_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr FeFuncB_ Exponent  String  where
  attr Exponent value = unsafeAttribute (  
    { key: "exponent", value: prop' value  } <$ _)
instance Attr FeFuncB_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr FeFuncG_ Exponent  String  where
  attr Exponent value = unsafeAttribute (  
    { key: "exponent", value: prop' value  } <$ _)
instance Attr FeFuncG_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr FeFuncR_ Exponent  String  where
  attr Exponent value = unsafeAttribute (  
    { key: "exponent", value: prop' value  } <$ _)
instance Attr FeFuncR_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "exponent", value: prop' value }


instance Attr everything Exponent  Unit  where
  attr Exponent _ = unsafeAttribute (  
    { key: "exponent", value: unset'  } <$ _)
instance Attr everything Exponent (Event.Event  Unit ) where
  attr Exponent eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "exponent", value: unset' }
