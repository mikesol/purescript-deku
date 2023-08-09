module Deku.DOM.Attr.Offset where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Offset = Offset
instance Attr FeFuncA_ Offset  String  where
  attr Offset value = unsafeAttribute (  
    { key: "offset", value: prop' value  } <$ _)
instance Attr FeFuncA_ Offset (Event.Event Unit -> Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute (map (map (
    \value -> { key: "offset", value: prop' value })) eventValue)
instance Attr FeFuncA_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "offset", value: prop' value }
instance Attr FeFuncB_ Offset  String  where
  attr Offset value = unsafeAttribute (  
    { key: "offset", value: prop' value  } <$ _)
instance Attr FeFuncB_ Offset (Event.Event Unit -> Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute (map (map (
    \value -> { key: "offset", value: prop' value })) eventValue)
instance Attr FeFuncB_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "offset", value: prop' value }
instance Attr FeFuncG_ Offset  String  where
  attr Offset value = unsafeAttribute (  
    { key: "offset", value: prop' value  } <$ _)
instance Attr FeFuncG_ Offset (Event.Event Unit -> Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute (map (map (
    \value -> { key: "offset", value: prop' value })) eventValue)
instance Attr FeFuncG_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "offset", value: prop' value }
instance Attr FeFuncR_ Offset  String  where
  attr Offset value = unsafeAttribute (  
    { key: "offset", value: prop' value  } <$ _)
instance Attr FeFuncR_ Offset (Event.Event Unit -> Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute (map (map (
    \value -> { key: "offset", value: prop' value })) eventValue)
instance Attr FeFuncR_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "offset", value: prop' value }
instance Attr Stop_ Offset  String  where
  attr Offset value = unsafeAttribute (  
    { key: "offset", value: prop' value  } <$ _)
instance Attr Stop_ Offset (Event.Event Unit -> Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute (map (map (
    \value -> { key: "offset", value: prop' value })) eventValue)
instance Attr Stop_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "offset", value: prop' value }
instance Attr everything Offset  Unit  where
  attr Offset _ = unsafeAttribute (  { key: "offset", value: unset'  } <$ _)
instance Attr everything Offset (Event.Event Unit -> Event.Event  Unit ) where
  attr Offset eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "offset", value: unset' })) eventValue)
instance Attr everything Offset (Event.Event  Unit ) where
  attr Offset eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "offset", value: unset' }