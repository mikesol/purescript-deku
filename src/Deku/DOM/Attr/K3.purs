module Deku.DOM.Attr.K3 where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K3 = K3

instance Attr FeComposite_ K3  String  where
  attr K3 value = unsafeAttribute (  { key: "k3", value: prop' value  } <$ _)
instance Attr FeComposite_ K3 (Event.Event  String ) where
  attr K3 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "k3", value: prop' value }


instance Attr everything K3  Unit  where
  attr K3 _ = unsafeAttribute (  { key: "k3", value: unset'  } <$ _)
instance Attr everything K3 (Event.Event  Unit ) where
  attr K3 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "k3", value: unset' }
