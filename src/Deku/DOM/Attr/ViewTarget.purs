module Deku.DOM.Attr.ViewTarget where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewTarget = ViewTarget

instance Attr View_ ViewTarget  String  where
  attr ViewTarget value = unsafeAttribute $ Left $  
    { key: "viewTarget", value: prop' value }
instance Attr View_ ViewTarget (Event.Event  String ) where
  attr ViewTarget eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "viewTarget", value: prop' value }


instance Attr everything ViewTarget  Unit  where
  attr ViewTarget _ = unsafeAttribute $ Left $  
    { key: "viewTarget", value: unset' }
instance Attr everything ViewTarget (Event.Event  Unit ) where
  attr ViewTarget eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "viewTarget", value: unset' }
