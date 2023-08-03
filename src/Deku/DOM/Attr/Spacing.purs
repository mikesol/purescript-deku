module Deku.DOM.Attr.Spacing where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Spacing = Spacing

instance Attr TextPath_ Spacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr Spacing bothValues = unsafeAttribute $ Both
    { key: "spacing", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "spacing", value: prop' value })
instance Attr TextPath_ Spacing  String  where
  attr Spacing value = unsafeAttribute $ This $ pure $
    { key: "spacing", value: prop' value }
instance Attr TextPath_ Spacing (Event.Event  String ) where
  attr Spacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "spacing", value: prop' value }

instance Attr everything Spacing (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Spacing bothValues = unsafeAttribute $ Both
    { key: "spacing", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "spacing", value: unset' })
instance Attr everything Spacing  Unit  where
  attr Spacing _ = unsafeAttribute $ This $ pure $ { key: "spacing", value: unset' }
instance Attr everything Spacing (Event.Event  Unit ) where
  attr Spacing eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "spacing", value: unset' }
