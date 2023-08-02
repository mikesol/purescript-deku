module Deku.DOM.Attr.Version where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Version = Version

instance Attr Svg_ Version (NonEmpty.NonEmpty Event.Event  String ) where
  attr Version bothValues = unsafeAttribute $ Both
    { key: "version", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "version", value: prop' value })
instance Attr Svg_ Version  String  where
  attr Version value = unsafeAttribute $ This
    { key: "version", value: prop' value }
instance Attr Svg_ Version (Event.Event  String ) where
  attr Version eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "version", value: prop' value }

instance Attr everything Version (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Version bothValues = unsafeAttribute $ Both
    { key: "version", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "version", value: unset' })
instance Attr everything Version  Unit  where
  attr Version _ = unsafeAttribute $ This { key: "version", value: unset' }
instance Attr everything Version (Event.Event  Unit ) where
  attr Version eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "version", value: unset' }
