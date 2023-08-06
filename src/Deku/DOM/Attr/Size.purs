module Deku.DOM.Attr.Size where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Size = Size

instance Attr Input_ Size  String  where
  attr Size value = unsafeAttribute $ Left $  
    { key: "size", value: prop' value }
instance Attr Input_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "size", value: prop' value }


instance Attr Select_ Size  String  where
  attr Size value = unsafeAttribute $ Left $  
    { key: "size", value: prop' value }
instance Attr Select_ Size (Event.Event  String ) where
  attr Size eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "size", value: prop' value }


instance Attr everything Size  Unit  where
  attr Size _ = unsafeAttribute $ Left $  { key: "size", value: unset' }
instance Attr everything Size (Event.Event  Unit ) where
  attr Size eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "size", value: unset' }
