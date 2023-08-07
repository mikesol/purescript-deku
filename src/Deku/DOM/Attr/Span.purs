module Deku.DOM.Attr.Span where


import Prelude

import FRP.Event as Event
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Span = Span

instance Attr Col_ Span  String  where
  attr Span value = unsafeAttribute (  
    { key: "span", value: prop' value  } <$ _)
instance Attr Col_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "span", value: prop' value }


instance Attr Colgroup_ Span  String  where
  attr Span value = unsafeAttribute (  
    { key: "span", value: prop' value  } <$ _)
instance Attr Colgroup_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "span", value: prop' value }


instance Attr everything Span  Unit  where
  attr Span _ = unsafeAttribute (  { key: "span", value: unset'  } <$ _)
instance Attr everything Span (Event.Event  Unit ) where
  attr Span eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "span", value: unset' }
