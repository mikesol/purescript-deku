module Deku.DOM.Attr.K1 where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K1 = K1

instance Attr FeComposite_ K1  String  where
  attr K1 value = unsafeAttribute (  { key: "k1", value: prop' value  } <$ _)
instance Attr FeComposite_ K1 (Event.Event  String ) where
  attr K1 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "k1", value: prop' value }


instance Attr everything K1  Unit  where
  attr K1 _ = unsafeAttribute (  { key: "k1", value: unset'  } <$ _)
instance Attr everything K1 (Event.Event  Unit ) where
  attr K1 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "k1", value: unset' }
