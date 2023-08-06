module Deku.DOM.Attr.Code where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Applet (Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Code = Code

instance Attr Applet_ Code  String  where
  attr Code value = unsafeAttribute $ Left $  
    { key: "code", value: prop' value }
instance Attr Applet_ Code (Event.Event  String ) where
  attr Code eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "code", value: prop' value }


instance Attr everything Code  Unit  where
  attr Code _ = unsafeAttribute $ Left $  { key: "code", value: unset' }
instance Attr everything Code (Event.Event  Unit ) where
  attr Code eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "code", value: unset' }
