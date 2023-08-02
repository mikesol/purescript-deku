module Deku.DOM.Attr.EdgeMode where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data EdgeMode = EdgeMode

instance Attr FeConvolveMatrix_ EdgeMode (NonEmpty.NonEmpty Event.Event  String ) where
  attr EdgeMode bothValues = unsafeAttribute $ Both
    { key: "edgeMode", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "edgeMode", value: prop' value })
instance Attr FeConvolveMatrix_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute $ This
    { key: "edgeMode", value: prop' value }
instance Attr FeConvolveMatrix_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }

instance Attr FeGaussianBlur_ EdgeMode (NonEmpty.NonEmpty Event.Event  String ) where
  attr EdgeMode bothValues = unsafeAttribute $ Both
    { key: "edgeMode", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "edgeMode", value: prop' value })
instance Attr FeGaussianBlur_ EdgeMode  String  where
  attr EdgeMode value = unsafeAttribute $ This
    { key: "edgeMode", value: prop' value }
instance Attr FeGaussianBlur_ EdgeMode (Event.Event  String ) where
  attr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "edgeMode", value: prop' value }

instance Attr everything EdgeMode (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr EdgeMode bothValues = unsafeAttribute $ Both
    { key: "edgeMode", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "edgeMode", value: unset' })
instance Attr everything EdgeMode  Unit  where
  attr EdgeMode _ = unsafeAttribute $ This
    { key: "edgeMode", value: unset' }
instance Attr everything EdgeMode (Event.Event  Unit ) where
  attr EdgeMode eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "edgeMode", value: unset' }
