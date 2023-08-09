module Deku.DOM.Attr.Manifest where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Html (Html_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Manifest = Manifest
instance Attr Html_ Manifest  String  where
  attr Manifest value = unsafeAttribute (  
    { key: "manifest", value: prop' value  } <$ _)
instance Attr Html_ Manifest (Event.Event Unit -> Event.Event  String ) where
  attr Manifest eventValue = unsafeAttribute (map (map (
    \value -> { key: "manifest", value: prop' value })) eventValue)
instance Attr Html_ Manifest (Event.Event  String ) where
  attr Manifest eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "manifest", value: prop' value }
instance Attr everything Manifest  Unit  where
  attr Manifest _ = unsafeAttribute (  
    { key: "manifest", value: unset'  } <$ _)
instance Attr everything Manifest (Event.Event Unit -> Event.Event  Unit ) where
  attr Manifest eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "manifest", value: unset' })) eventValue)
instance Attr everything Manifest (Event.Event  Unit ) where
  attr Manifest eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "manifest", value: unset' }