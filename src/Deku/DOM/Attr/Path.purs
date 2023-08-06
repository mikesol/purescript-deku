module Deku.DOM.Attr.Path where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Path = Path

instance Attr AnimateMotion_ Path  String  where
  attr Path value = unsafeAttribute $ Left $  
    { key: "path", value: prop' value }
instance Attr AnimateMotion_ Path (Event.Event  String ) where
  attr Path eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "path", value: prop' value }


instance Attr TextPath_ Path  String  where
  attr Path value = unsafeAttribute $ Left $  
    { key: "path", value: prop' value }
instance Attr TextPath_ Path (Event.Event  String ) where
  attr Path eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "path", value: prop' value }


instance Attr everything Path  Unit  where
  attr Path _ = unsafeAttribute $ Left $  { key: "path", value: unset' }
instance Attr everything Path (Event.Event  Unit ) where
  attr Path eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "path", value: unset' }
