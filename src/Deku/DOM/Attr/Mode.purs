module Deku.DOM.Attr.Mode where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Mode = Mode
instance Attr FeBlend_ Mode  String  where
  attr Mode value = unsafeAttribute (  
    { key: "mode", value: prop' value  } <$ _)
instance Attr FeBlend_ Mode (Event.Event Unit -> Event.Event  String ) where
  attr Mode eventValue = unsafeAttribute (map (map ( \value ->
    { key: "mode", value: prop' value })) eventValue)
instance Attr FeBlend_ Mode (Event.Event  String ) where
  attr Mode eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "mode", value: prop' value }
instance Attr everything Mode  Unit  where
  attr Mode _ = unsafeAttribute (  { key: "mode", value: unset'  } <$ _)
instance Attr everything Mode (Event.Event Unit -> Event.Event  Unit ) where
  attr Mode eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "mode", value: unset' })) eventValue)
instance Attr everything Mode (Event.Event  Unit ) where
  attr Mode eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "mode", value: unset' }