module Deku.DOM.Attr.K2 where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data K2 = K2
instance Attr FeComposite_ K2  String  where
  attr K2 value = unsafeAttribute (  { key: "k2", value: prop' value  } <$ _)
instance Attr FeComposite_ K2 (Event.Event Unit -> Event.Event  String ) where
  attr K2 eventValue = unsafeAttribute (map (map ( \value ->
    { key: "k2", value: prop' value })) eventValue)
instance Attr FeComposite_ K2 (Event.Event  String ) where
  attr K2 eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "k2", value: prop' value }
instance Attr everything K2  Unit  where
  attr K2 _ = unsafeAttribute (  { key: "k2", value: unset'  } <$ _)
instance Attr everything K2 (Event.Event Unit -> Event.Event  Unit ) where
  attr K2 eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "k2", value: unset' })) eventValue)
instance Attr everything K2 (Event.Event  Unit ) where
  attr K2 eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "k2", value: unset' }