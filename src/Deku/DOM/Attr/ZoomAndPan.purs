module Deku.DOM.Attr.ZoomAndPan where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ZoomAndPan = ZoomAndPan

instance Attr View_ ZoomAndPan (NonEmpty.NonEmpty Event.Event  String ) where
  attr ZoomAndPan bothValues = unsafeAttribute $ Both
    { key: "zoomAndPan", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "zoomAndPan", value: prop' value })
instance Attr View_ ZoomAndPan  String  where
  attr ZoomAndPan value = unsafeAttribute $ This
    { key: "zoomAndPan", value: prop' value }
instance Attr View_ ZoomAndPan (Event.Event  String ) where
  attr ZoomAndPan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "zoomAndPan", value: prop' value }

instance Attr everything ZoomAndPan (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ZoomAndPan bothValues = unsafeAttribute $ Both
    { key: "zoomAndPan", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "zoomAndPan", value: unset' })
instance Attr everything ZoomAndPan  Unit  where
  attr ZoomAndPan _ = unsafeAttribute $ This
    { key: "zoomAndPan", value: unset' }
instance Attr everything ZoomAndPan (Event.Event  Unit ) where
  attr ZoomAndPan eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "zoomAndPan", value: unset' }
