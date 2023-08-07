module Deku.DOM.Attr.Ping where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ping = Ping

instance Attr A_ Ping  String  where
  attr Ping value = unsafeAttribute (  
    { key: "ping", value: prop' value  } <$ _)
instance Attr A_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "ping", value: prop' value }


instance Attr Area_ Ping  String  where
  attr Ping value = unsafeAttribute (  
    { key: "ping", value: prop' value  } <$ _)
instance Attr Area_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "ping", value: prop' value }


instance Attr everything Ping  Unit  where
  attr Ping _ = unsafeAttribute (  { key: "ping", value: unset'  } <$ _)
instance Attr everything Ping (Event.Event  Unit ) where
  attr Ping eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "ping", value: unset' }
