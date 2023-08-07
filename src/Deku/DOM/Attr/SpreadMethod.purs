module Deku.DOM.Attr.SpreadMethod where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpreadMethod = SpreadMethod

instance Attr LinearGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute (  
    { key: "spreadMethod", value: prop' value  } <$ _)
instance Attr LinearGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }


instance Attr RadialGradient_ SpreadMethod  String  where
  attr SpreadMethod value = unsafeAttribute (  
    { key: "spreadMethod", value: prop' value  } <$ _)
instance Attr RadialGradient_ SpreadMethod (Event.Event  String ) where
  attr SpreadMethod eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "spreadMethod", value: prop' value }


instance Attr everything SpreadMethod  Unit  where
  attr SpreadMethod _ = unsafeAttribute (  
    { key: "spreadMethod", value: unset'  } <$ _)
instance Attr everything SpreadMethod (Event.Event  Unit ) where
  attr SpreadMethod eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "spreadMethod", value: unset' }
