module Deku.DOM.Attr.Muted where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Muted = Muted
instance Attr Audio_ Muted  String  where
  attr Muted value = unsafeAttribute (  
    { key: "muted", value: prop' value  } <$ _)
instance Attr Audio_ Muted (Event.Event Unit -> Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute (map (map (
    \value -> { key: "muted", value: prop' value })) eventValue)
instance Attr Audio_ Muted (Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "muted", value: prop' value }
instance Attr Video_ Muted  String  where
  attr Muted value = unsafeAttribute (  
    { key: "muted", value: prop' value  } <$ _)
instance Attr Video_ Muted (Event.Event Unit -> Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute (map (map (
    \value -> { key: "muted", value: prop' value })) eventValue)
instance Attr Video_ Muted (Event.Event  String ) where
  attr Muted eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "muted", value: prop' value }
instance Attr everything Muted  Unit  where
  attr Muted _ = unsafeAttribute (  { key: "muted", value: unset'  } <$ _)
instance Attr everything Muted (Event.Event Unit -> Event.Event  Unit ) where
  attr Muted eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "muted", value: unset' })) eventValue)
instance Attr everything Muted (Event.Event  Unit ) where
  attr Muted eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "muted", value: unset' }