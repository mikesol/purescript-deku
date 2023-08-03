module Deku.DOM.Attr.GradientUnits where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientUnits = GradientUnits

instance Attr LinearGradient_ GradientUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "gradientUnits", value: prop' value })
instance Attr LinearGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute $ This $ pure $
    { key: "gradientUnits", value: prop' value }
instance Attr LinearGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }

instance Attr RadialGradient_ GradientUnits (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientUnits", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "gradientUnits", value: prop' value })
instance Attr RadialGradient_ GradientUnits  String  where
  attr GradientUnits value = unsafeAttribute $ This $ pure $
    { key: "gradientUnits", value: prop' value }
instance Attr RadialGradient_ GradientUnits (Event.Event  String ) where
  attr GradientUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "gradientUnits", value: prop' value }

instance Attr everything GradientUnits (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr GradientUnits bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientUnits", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "gradientUnits", value: unset' })
instance Attr everything GradientUnits  Unit  where
  attr GradientUnits _ = unsafeAttribute $ This $ pure $
    { key: "gradientUnits", value: unset' }
instance Attr everything GradientUnits (Event.Event  Unit ) where
  attr GradientUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "gradientUnits", value: unset' }
