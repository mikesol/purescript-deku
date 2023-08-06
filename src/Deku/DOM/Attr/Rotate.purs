module Deku.DOM.Attr.Rotate where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rotate = Rotate

instance Attr AnimateMotion_ Rotate  String  where
  attr Rotate value = unsafeAttribute $ Left $  
    { key: "rotate", value: prop' value }
instance Attr AnimateMotion_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }


instance Attr Text_ Rotate  String  where
  attr Rotate value = unsafeAttribute $ Left $  
    { key: "rotate", value: prop' value }
instance Attr Text_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }


instance Attr Tspan_ Rotate  String  where
  attr Rotate value = unsafeAttribute $ Left $  
    { key: "rotate", value: prop' value }
instance Attr Tspan_ Rotate (Event.Event  String ) where
  attr Rotate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "rotate", value: prop' value }


instance Attr everything Rotate  Unit  where
  attr Rotate _ = unsafeAttribute $ Left $  { key: "rotate", value: unset' }
instance Attr everything Rotate (Event.Event  Unit ) where
  attr Rotate eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "rotate", value: unset' }
