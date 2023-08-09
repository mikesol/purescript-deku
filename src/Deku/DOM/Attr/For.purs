module Deku.DOM.Attr.For where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Output (Output_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data For = For
instance Attr Label_ For  String  where
  attr For value = unsafeAttribute (  { key: "for", value: prop' value  } <$ _)
instance Attr Label_ For (Event.Event Unit -> Event.Event  String ) where
  attr For eventValue = unsafeAttribute (map (map ( \value ->
    { key: "for", value: prop' value })) eventValue)
instance Attr Label_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "for", value: prop' value }
instance Attr Output_ For  String  where
  attr For value = unsafeAttribute (  { key: "for", value: prop' value  } <$ _)
instance Attr Output_ For (Event.Event Unit -> Event.Event  String ) where
  attr For eventValue = unsafeAttribute (map (map ( \value ->
    { key: "for", value: prop' value })) eventValue)
instance Attr Output_ For (Event.Event  String ) where
  attr For eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "for", value: prop' value }
instance Attr everything For  Unit  where
  attr For _ = unsafeAttribute (  { key: "for", value: unset'  } <$ _)
instance Attr everything For (Event.Event Unit -> Event.Event  Unit ) where
  attr For eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "for", value: unset' })) eventValue)
instance Attr everything For (Event.Event  Unit ) where
  attr For eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "for", value: unset' }