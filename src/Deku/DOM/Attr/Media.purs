module Deku.DOM.Attr.Media where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Media = Media
instance Attr A_ Media  String  where
  attr Media value = unsafeAttribute (  
    { key: "media", value: prop' value  } <$ _)
instance Attr A_ Media (Event.Event Unit -> Event.Event  String ) where
  attr Media eventValue = unsafeAttribute (map (map (
    \value -> { key: "media", value: prop' value })) eventValue)
instance Attr A_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "media", value: prop' value }
instance Attr Area_ Media  String  where
  attr Media value = unsafeAttribute (  
    { key: "media", value: prop' value  } <$ _)
instance Attr Area_ Media (Event.Event Unit -> Event.Event  String ) where
  attr Media eventValue = unsafeAttribute (map (map (
    \value -> { key: "media", value: prop' value })) eventValue)
instance Attr Area_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "media", value: prop' value }
instance Attr Link_ Media  String  where
  attr Media value = unsafeAttribute (  
    { key: "media", value: prop' value  } <$ _)
instance Attr Link_ Media (Event.Event Unit -> Event.Event  String ) where
  attr Media eventValue = unsafeAttribute (map (map (
    \value -> { key: "media", value: prop' value })) eventValue)
instance Attr Link_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "media", value: prop' value }
instance Attr Source_ Media  String  where
  attr Media value = unsafeAttribute (  
    { key: "media", value: prop' value  } <$ _)
instance Attr Source_ Media (Event.Event Unit -> Event.Event  String ) where
  attr Media eventValue = unsafeAttribute (map (map (
    \value -> { key: "media", value: prop' value })) eventValue)
instance Attr Source_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "media", value: prop' value }
instance Attr Style_ Media  String  where
  attr Media value = unsafeAttribute (  
    { key: "media", value: prop' value  } <$ _)
instance Attr Style_ Media (Event.Event Unit -> Event.Event  String ) where
  attr Media eventValue = unsafeAttribute (map (map (
    \value -> { key: "media", value: prop' value })) eventValue)
instance Attr Style_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "media", value: prop' value }
instance Attr everything Media  Unit  where
  attr Media _ = unsafeAttribute (  { key: "media", value: unset'  } <$ _)
instance Attr everything Media (Event.Event Unit -> Event.Event  Unit ) where
  attr Media eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "media", value: unset' })) eventValue)
instance Attr everything Media (Event.Event  Unit ) where
  attr Media eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "media", value: unset' }