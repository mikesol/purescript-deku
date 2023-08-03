module Deku.DOM.Attr.Order where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Order = Order

instance Attr FeConvolveMatrix_ Order (NonEmpty.NonEmpty Event.Event  String ) where
  attr Order bothValues = unsafeAttribute $ Both
    { key: "order", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "order", value: prop' value })
instance Attr FeConvolveMatrix_ Order  String  where
  attr Order value = unsafeAttribute $ This $ pure $
    { key: "order", value: prop' value }
instance Attr FeConvolveMatrix_ Order (Event.Event  String ) where
  attr Order eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "order", value: prop' value }

instance Attr everything Order (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Order bothValues = unsafeAttribute $ Both { key: "order", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "order", value: unset' })
instance Attr everything Order  Unit  where
  attr Order _ = unsafeAttribute $ This $ pure $ { key: "order", value: unset' }
instance Attr everything Order (Event.Event  Unit ) where
  attr Order eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "order", value: unset' }
