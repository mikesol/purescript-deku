module Deku.DOM.Attr.Z where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Z = Z

instance Attr FePointLight_ Z  String  where
  attr Z value = unsafeAttribute (  { key: "z", value: prop' value  } <$ _)
instance Attr FePointLight_ Z (Event.Event  String ) where
  attr Z eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "z", value: prop' value }


instance Attr FeSpotLight_ Z  String  where
  attr Z value = unsafeAttribute (  { key: "z", value: prop' value  } <$ _)
instance Attr FeSpotLight_ Z (Event.Event  String ) where
  attr Z eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "z", value: prop' value }


instance Attr everything Z  Unit  where
  attr Z _ = unsafeAttribute (  { key: "z", value: unset'  } <$ _)
instance Attr everything Z (Event.Event  Unit ) where
  attr Z eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "z", value: unset' }
