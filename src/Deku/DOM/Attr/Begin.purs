module Deku.DOM.Attr.Begin where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Begin = Begin

instance Attr Animate_ Begin  String  where
  attr Begin value = unsafeAttribute $ Left $  
    { key: "begin", value: prop' value }
instance Attr Animate_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "begin", value: prop' value }


instance Attr AnimateMotion_ Begin  String  where
  attr Begin value = unsafeAttribute $ Left $  
    { key: "begin", value: prop' value }
instance Attr AnimateMotion_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "begin", value: prop' value }


instance Attr AnimateTransform_ Begin  String  where
  attr Begin value = unsafeAttribute $ Left $  
    { key: "begin", value: prop' value }
instance Attr AnimateTransform_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "begin", value: prop' value }


instance Attr Set_ Begin  String  where
  attr Begin value = unsafeAttribute $ Left $  
    { key: "begin", value: prop' value }
instance Attr Set_ Begin (Event.Event  String ) where
  attr Begin eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "begin", value: prop' value }


instance Attr everything Begin  Unit  where
  attr Begin _ = unsafeAttribute $ Left $  { key: "begin", value: unset' }
instance Attr everything Begin (Event.Event  Unit ) where
  attr Begin eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "begin", value: unset' }
