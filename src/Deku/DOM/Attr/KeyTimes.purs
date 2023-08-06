module Deku.DOM.Attr.KeyTimes where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyTimes = KeyTimes

instance Attr Animate_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ Left $  
    { key: "keyTimes", value: prop' value }
instance Attr Animate_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }


instance Attr AnimateMotion_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ Left $  
    { key: "keyTimes", value: prop' value }
instance Attr AnimateMotion_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }


instance Attr AnimateTransform_ KeyTimes  String  where
  attr KeyTimes value = unsafeAttribute $ Left $  
    { key: "keyTimes", value: prop' value }
instance Attr AnimateTransform_ KeyTimes (Event.Event  String ) where
  attr KeyTimes eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keyTimes", value: prop' value }


instance Attr everything KeyTimes  Unit  where
  attr KeyTimes _ = unsafeAttribute $ Left $  
    { key: "keyTimes", value: unset' }
instance Attr everything KeyTimes (Event.Event  Unit ) where
  attr KeyTimes eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "keyTimes", value: unset' }
