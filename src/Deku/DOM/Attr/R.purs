module Deku.DOM.Attr.R where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data R = R

instance Attr Circle_ R (NonEmpty.NonEmpty Event.Event  String ) where
  attr R bothValues = unsafeAttribute $ Both
    { key: "r", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "r", value: prop' value })
instance Attr Circle_ R  String  where
  attr R value = unsafeAttribute $ This $ pure $ { key: "r", value: prop' value }
instance Attr Circle_ R (Event.Event  String ) where
  attr R eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "r", value: prop' value }

instance Attr RadialGradient_ R (NonEmpty.NonEmpty Event.Event  String ) where
  attr R bothValues = unsafeAttribute $ Both
    { key: "r", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "r", value: prop' value })
instance Attr RadialGradient_ R  String  where
  attr R value = unsafeAttribute $ This $ pure $ { key: "r", value: prop' value }
instance Attr RadialGradient_ R (Event.Event  String ) where
  attr R eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "r", value: prop' value }

instance Attr everything R (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr R bothValues = unsafeAttribute $ Both { key: "r", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "r", value: unset' })
instance Attr everything R  Unit  where
  attr R _ = unsafeAttribute $ This $ pure $ { key: "r", value: unset' }
instance Attr everything R (Event.Event  Unit ) where
  attr R eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "r", value: unset' }
