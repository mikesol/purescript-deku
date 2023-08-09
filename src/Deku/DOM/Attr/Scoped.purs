module Deku.DOM.Attr.Scoped where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Scoped = Scoped
instance Attr Style_ Scoped  String  where
  attr Scoped value = unsafeAttribute (  
    { key: "scoped", value: prop' value  } <$ _)
instance Attr Style_ Scoped (Event.Event Unit -> Event.Event  String ) where
  attr Scoped eventValue = unsafeAttribute (map (map (
    \value -> { key: "scoped", value: prop' value })) eventValue)
instance Attr Style_ Scoped (Event.Event  String ) where
  attr Scoped eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "scoped", value: prop' value }
instance Attr everything Scoped  Unit  where
  attr Scoped _ = unsafeAttribute (  { key: "scoped", value: unset'  } <$ _)
instance Attr everything Scoped (Event.Event Unit -> Event.Event  Unit ) where
  attr Scoped eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "scoped", value: unset' })) eventValue)
instance Attr everything Scoped (Event.Event  Unit ) where
  attr Scoped eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "scoped", value: unset' }