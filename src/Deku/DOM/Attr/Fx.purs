module Deku.DOM.Attr.Fx where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fx = Fx

instance Attr RadialGradient_ Fx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Fx bothValues = unsafeAttribute $ Both
    { key: "fx", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "fx", value: prop' value })
instance Attr RadialGradient_ Fx  String  where
  attr Fx value = unsafeAttribute $ This $ pure $ { key: "fx", value: prop' value }
instance Attr RadialGradient_ Fx (Event.Event  String ) where
  attr Fx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "fx", value: prop' value }

instance Attr everything Fx (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Fx bothValues = unsafeAttribute $ Both { key: "fx", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "fx", value: unset' })
instance Attr everything Fx  Unit  where
  attr Fx _ = unsafeAttribute $ This $ pure $ { key: "fx", value: unset' }
instance Attr everything Fx (Event.Event  Unit ) where
  attr Fx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fx", value: unset' }
