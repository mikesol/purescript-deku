module Deku.DOM.Attr.Bias where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bias = Bias

instance Attr FeConvolveMatrix_ Bias  String  where
  attr Bias value = unsafeAttribute (  
    { key: "bias", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ Bias (Event.Event  String ) where
  attr Bias eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "bias", value: prop' value }


instance Attr everything Bias  Unit  where
  attr Bias _ = unsafeAttribute (  { key: "bias", value: unset'  } <$ _)
instance Attr everything Bias (Event.Event  Unit ) where
  attr Bias eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "bias", value: unset' }
