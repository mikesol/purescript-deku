module Deku.DOM.Attr.RefY where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RefY = RefY

instance Attr Marker_ RefY  String  where
  attr RefY value = unsafeAttribute $ Left $  
    { key: "refY", value: prop' value }
instance Attr Marker_ RefY (Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "refY", value: prop' value }


instance Attr Symbol_ RefY  String  where
  attr RefY value = unsafeAttribute $ Left $  
    { key: "refY", value: prop' value }
instance Attr Symbol_ RefY (Event.Event  String ) where
  attr RefY eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "refY", value: prop' value }


instance Attr everything RefY  Unit  where
  attr RefY _ = unsafeAttribute $ Left $  { key: "refY", value: unset' }
instance Attr everything RefY (Event.Event  Unit ) where
  attr RefY eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "refY", value: unset' }
