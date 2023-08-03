module Deku.DOM.Attr.BaseProfile where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseProfile = BaseProfile

instance Attr Svg_ BaseProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaseProfile bothValues = unsafeAttribute $ Both
    { key: "baseProfile", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "baseProfile", value: prop' value })
instance Attr Svg_ BaseProfile  String  where
  attr BaseProfile value = unsafeAttribute $ This $ pure $
    { key: "baseProfile", value: prop' value }
instance Attr Svg_ BaseProfile (Event.Event  String ) where
  attr BaseProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseProfile", value: prop' value }

instance Attr everything BaseProfile (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr BaseProfile bothValues = unsafeAttribute $ Both
    { key: "baseProfile", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "baseProfile", value: unset' })
instance Attr everything BaseProfile  Unit  where
  attr BaseProfile _ = unsafeAttribute $ This $ pure $
    { key: "baseProfile", value: unset' }
instance Attr everything BaseProfile (Event.Event  Unit ) where
  attr BaseProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "baseProfile", value: unset' }
