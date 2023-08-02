module Deku.DOM.Attr.BaseFrequency where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaseFrequency bothValues = unsafeAttribute $ Both
    { key: "baseFrequency", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "baseFrequency", value: prop' value })
instance Attr FeTurbulence_ BaseFrequency  String  where
  attr BaseFrequency value = unsafeAttribute $ This
    { key: "baseFrequency", value: prop' value }
instance Attr FeTurbulence_ BaseFrequency (Event.Event  String ) where
  attr BaseFrequency eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseFrequency", value: prop' value }

instance Attr everything BaseFrequency (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr BaseFrequency bothValues = unsafeAttribute $ Both
    { key: "baseFrequency", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "baseFrequency", value: unset' })
instance Attr everything BaseFrequency  Unit  where
  attr BaseFrequency _ = unsafeAttribute $ This
    { key: "baseFrequency", value: unset' }
instance Attr everything BaseFrequency (Event.Event  Unit ) where
  attr BaseFrequency eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "baseFrequency", value: unset' }
