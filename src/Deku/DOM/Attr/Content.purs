module Deku.DOM.Attr.Content where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Content = Content
instance Attr Meta_ Content  String  where
  attr Content value = unsafeAttribute (  
    { key: "content", value: prop' value  } <$ _)
instance Attr Meta_ Content (Event.Event Unit -> Event.Event  String ) where
  attr Content eventValue = unsafeAttribute (map (map (
    \value -> { key: "content", value: prop' value })) eventValue)
instance Attr Meta_ Content (Event.Event  String ) where
  attr Content eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "content", value: prop' value }
instance Attr everything Content  Unit  where
  attr Content _ = unsafeAttribute (  { key: "content", value: unset'  } <$ _)
instance Attr everything Content (Event.Event Unit -> Event.Event  Unit ) where
  attr Content eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "content", value: unset' })) eventValue)
instance Attr everything Content (Event.Event  Unit ) where
  attr Content eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "content", value: unset' }