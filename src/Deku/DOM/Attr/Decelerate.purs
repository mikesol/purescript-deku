module Deku.DOM.Attr.Decelerate where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decelerate = Decelerate

instance Attr AnimateTransform_ Decelerate  String  where
  attr Decelerate value = unsafeAttribute $ Left $  
    { key: "decelerate", value: prop' value }
instance Attr AnimateTransform_ Decelerate (Event.Event  String ) where
  attr Decelerate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "decelerate", value: prop' value }


instance Attr everything Decelerate  Unit  where
  attr Decelerate _ = unsafeAttribute $ Left $  
    { key: "decelerate", value: unset' }
instance Attr everything Decelerate (Event.Event  Unit ) where
  attr Decelerate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "decelerate", value: unset' }
