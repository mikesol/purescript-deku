module Deku.DOM.Attr.Loop where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Loop = Loop
instance Attr Audio_ Loop  String  where
  attr Loop value = unsafeAttribute (  
    { key: "loop", value: prop' value  } <$ _)
instance Attr Audio_ Loop (Event.Event Unit -> Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute (map (map ( \value ->
    { key: "loop", value: prop' value })) eventValue)
instance Attr Audio_ Loop (Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "loop", value: prop' value }
instance Attr Video_ Loop  String  where
  attr Loop value = unsafeAttribute (  
    { key: "loop", value: prop' value  } <$ _)
instance Attr Video_ Loop (Event.Event Unit -> Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute (map (map ( \value ->
    { key: "loop", value: prop' value })) eventValue)
instance Attr Video_ Loop (Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "loop", value: prop' value }
instance Attr everything Loop  Unit  where
  attr Loop _ = unsafeAttribute (  { key: "loop", value: unset'  } <$ _)
instance Attr everything Loop (Event.Event Unit -> Event.Event  Unit ) where
  attr Loop eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "loop", value: unset' })) eventValue)
instance Attr everything Loop (Event.Event  Unit ) where
  attr Loop eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "loop", value: unset' }