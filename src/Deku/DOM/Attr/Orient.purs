module Deku.DOM.Attr.Orient where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Orient = Orient

instance Attr Marker_ Orient (NonEmpty.NonEmpty Event.Event  String ) where
  attr Orient bothValues = unsafeAttribute $ Both
    { key: "orient", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "orient", value: prop' value })
instance Attr Marker_ Orient  String  where
  attr Orient value = unsafeAttribute $ This $ pure $
    { key: "orient", value: prop' value }
instance Attr Marker_ Orient (Event.Event  String ) where
  attr Orient eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "orient", value: prop' value }

instance Attr everything Orient (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Orient bothValues = unsafeAttribute $ Both
    { key: "orient", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "orient", value: unset' })
instance Attr everything Orient  Unit  where
  attr Orient _ = unsafeAttribute $ This $ pure $ { key: "orient", value: unset' }
instance Attr everything Orient (Event.Event  Unit ) where
  attr Orient eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "orient", value: unset' }
