module Deku.DOM.Attr.Divisor where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Divisor = Divisor

instance Attr FeConvolveMatrix_ Divisor  String  where
  attr Divisor value = unsafeAttribute $ Left $  
    { key: "divisor", value: prop' value }
instance Attr FeConvolveMatrix_ Divisor (Event.Event  String ) where
  attr Divisor eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "divisor", value: prop' value }


instance Attr everything Divisor  Unit  where
  attr Divisor _ = unsafeAttribute $ Left $  { key: "divisor", value: unset' }
instance Attr everything Divisor (Event.Event  Unit ) where
  attr Divisor eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "divisor", value: unset' }
