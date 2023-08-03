module Deku.DOM.Attr.Divisor where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Divisor = Divisor

instance Attr FeConvolveMatrix_ Divisor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Divisor bothValues = unsafeAttribute $ Both
    { key: "divisor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "divisor", value: prop' value })
instance Attr FeConvolveMatrix_ Divisor  String  where
  attr Divisor value = unsafeAttribute $ This $ pure $
    { key: "divisor", value: prop' value }
instance Attr FeConvolveMatrix_ Divisor (Event.Event  String ) where
  attr Divisor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "divisor", value: prop' value }

instance Attr everything Divisor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Divisor bothValues = unsafeAttribute $ Both
    { key: "divisor", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "divisor", value: unset' })
instance Attr everything Divisor  Unit  where
  attr Divisor _ = unsafeAttribute $ This $ pure $ { key: "divisor", value: unset' }
instance Attr everything Divisor (Event.Event  Unit ) where
  attr Divisor eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "divisor", value: unset' }
