module Deku.DOM.Attr.Order where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Order = Order

instance Attr FeConvolveMatrix_ Order  String  where
  attr Order value = unsafeAttribute (  
    { key: "order", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ Order (Event.Event  String ) where
  attr Order eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "order", value: prop' value }


instance Attr everything Order  Unit  where
  attr Order _ = unsafeAttribute (  { key: "order", value: unset'  } <$ _)
instance Attr everything Order (Event.Event  Unit ) where
  attr Order eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "order", value: unset' }
