module Deku.DOM.Attr.Shape where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Shape = Shape
instance Attr A_ Shape  String  where
  attr Shape value = unsafeAttribute (  
    { key: "shape", value: prop' value  } <$ _)
instance Attr A_ Shape (Event.Event Unit -> Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute (map (map (
    \value -> { key: "shape", value: prop' value })) eventValue)
instance Attr A_ Shape (Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "shape", value: prop' value }
instance Attr Area_ Shape  String  where
  attr Shape value = unsafeAttribute (  
    { key: "shape", value: prop' value  } <$ _)
instance Attr Area_ Shape (Event.Event Unit -> Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute (map (map (
    \value -> { key: "shape", value: prop' value })) eventValue)
instance Attr Area_ Shape (Event.Event  String ) where
  attr Shape eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "shape", value: prop' value }
instance Attr everything Shape  Unit  where
  attr Shape _ = unsafeAttribute (  { key: "shape", value: unset'  } <$ _)
instance Attr everything Shape (Event.Event Unit -> Event.Event  Unit ) where
  attr Shape eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "shape", value: unset' })) eventValue)
instance Attr everything Shape (Event.Event  Unit ) where
  attr Shape eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "shape", value: unset' }