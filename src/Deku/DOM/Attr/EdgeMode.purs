module Deku.DOM.Attr.EdgeMode where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data EdgeMode = EdgeMode

instance Attr FeConvolveMatrix_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute $ Left $  
    { key: "edgeMode", value: prop' value }
instance Attr FeConvolveMatrix_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }


instance Attr FeGaussianBlur_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute $ Left $  
    { key: "edgeMode", value: prop' value }
instance Attr FeGaussianBlur_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }


instance Attr everything EdgeMode  Unit  where
  attr EdgeMode _ = unsafeAttribute $ Left $  
    { key: "edgeMode", value: unset' }
instance Attr everything EdgeMode (Event.Event  Unit ) where
  attr EdgeMode eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "edgeMode", value: unset' }
