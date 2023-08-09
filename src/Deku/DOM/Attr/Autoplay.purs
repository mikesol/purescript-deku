module Deku.DOM.Attr.Autoplay where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Autoplay = Autoplay
instance Attr Audio_ Autoplay  String  where
  attr Autoplay value = unsafeAttribute (  
    { key: "autoplay", value: prop' value  } <$ _)
instance Attr Audio_ Autoplay (Event.Event Unit -> Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute (map (map (
    \value -> { key: "autoplay", value: prop' value })) eventValue)
instance Attr Audio_ Autoplay (Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autoplay", value: prop' value }
instance Attr Video_ Autoplay  String  where
  attr Autoplay value = unsafeAttribute (  
    { key: "autoplay", value: prop' value  } <$ _)
instance Attr Video_ Autoplay (Event.Event Unit -> Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute (map (map (
    \value -> { key: "autoplay", value: prop' value })) eventValue)
instance Attr Video_ Autoplay (Event.Event  String ) where
  attr Autoplay eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "autoplay", value: prop' value }
instance Attr everything Autoplay  Unit  where
  attr Autoplay _ = unsafeAttribute (  
    { key: "autoplay", value: unset'  } <$ _)
instance Attr everything Autoplay (Event.Event Unit -> Event.Event  Unit ) where
  attr Autoplay eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "autoplay", value: unset' })) eventValue)
instance Attr everything Autoplay (Event.Event  Unit ) where
  attr Autoplay eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "autoplay", value: unset' }