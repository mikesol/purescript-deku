module Deku.DOM.Attr.K4 where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K4 = K4

instance Attr FeComposite_ K4  String  where
  attr K4 value = unsafeAttribute (  { key: "k4", value: prop' value  } <$ _)
instance Attr FeComposite_ K4 (Event.Event  String ) where
  attr K4 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "k4", value: prop' value }


instance Attr everything K4  Unit  where
  attr K4 _ = unsafeAttribute (  { key: "k4", value: unset'  } <$ _)
instance Attr everything K4 (Event.Event  Unit ) where
  attr K4 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "k4", value: unset' }
