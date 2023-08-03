module Deku.DOM.Attr.Capture where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Capture = Capture

instance Attr Input_ Capture (NonEmpty.NonEmpty Event.Event  String ) where
  attr Capture bothValues = unsafeAttribute $ Both
    { key: "capture", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "capture", value: prop' value })
instance Attr Input_ Capture  String  where
  attr Capture value = unsafeAttribute $ This $ pure $
    { key: "capture", value: prop' value }
instance Attr Input_ Capture (Event.Event  String ) where
  attr Capture eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "capture", value: prop' value }

instance Attr everything Capture (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Capture bothValues = unsafeAttribute $ Both
    { key: "capture", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "capture", value: unset' })
instance Attr everything Capture  Unit  where
  attr Capture _ = unsafeAttribute $ This $ pure $ { key: "capture", value: unset' }
instance Attr everything Capture (Event.Event  Unit ) where
  attr Capture eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "capture", value: unset' }
