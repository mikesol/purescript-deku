module Deku.DOM.Attr.RefX where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RefX = RefX

instance Attr Marker_ RefX  String  where
  attr RefX value = unsafeAttribute $ Left $  
    { key: "refX", value: prop' value }
instance Attr Marker_ RefX (Event.Event  String ) where
  attr RefX eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "refX", value: prop' value }


instance Attr Symbol_ RefX  String  where
  attr RefX value = unsafeAttribute $ Left $  
    { key: "refX", value: prop' value }
instance Attr Symbol_ RefX (Event.Event  String ) where
  attr RefX eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "refX", value: prop' value }


instance Attr everything RefX  Unit  where
  attr RefX _ = unsafeAttribute $ Left $  { key: "refX", value: unset' }
instance Attr everything RefX (Event.Event  Unit ) where
  attr RefX eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "refX", value: unset' }
