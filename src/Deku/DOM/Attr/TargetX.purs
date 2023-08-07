module Deku.DOM.Attr.TargetX where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TargetX = TargetX

instance Attr FeConvolveMatrix_ TargetX  String  where
  attr TargetX value = unsafeAttribute (  
    { key: "targetX", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ TargetX (Event.Event  String ) where
  attr TargetX eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "targetX", value: prop' value }


instance Attr everything TargetX  Unit  where
  attr TargetX _ = unsafeAttribute (  { key: "targetX", value: unset'  } <$ _)
instance Attr everything TargetX (Event.Event  Unit ) where
  attr TargetX eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "targetX", value: unset' }
