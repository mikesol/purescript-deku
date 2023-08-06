module Deku.DOM.Attr.ZoomAndPan where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ZoomAndPan = ZoomAndPan

instance Attr View_ ZoomAndPan  String  where
  attr ZoomAndPan value = unsafeAttribute $ Left $  
    { key: "zoomAndPan", value: prop' value }
instance Attr View_ ZoomAndPan (Event.Event  String ) where
  attr ZoomAndPan eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "zoomAndPan", value: prop' value }


instance Attr everything ZoomAndPan  Unit  where
  attr ZoomAndPan _ = unsafeAttribute $ Left $  
    { key: "zoomAndPan", value: unset' }
instance Attr everything ZoomAndPan (Event.Event  Unit ) where
  attr ZoomAndPan eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "zoomAndPan", value: unset' }
