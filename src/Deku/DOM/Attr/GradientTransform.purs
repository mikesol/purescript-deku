module Deku.DOM.Attr.GradientTransform where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data GradientTransform = GradientTransform

instance Attr LinearGradient_ GradientTransform (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientTransform", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gradientTransform", value: prop' value }
    )
instance Attr LinearGradient_ GradientTransform  String  where
  attr GradientTransform value = unsafeAttribute $ This $ pure $
    { key: "gradientTransform", value: prop' value }
instance Attr LinearGradient_ GradientTransform (Event.Event  String ) where
  attr GradientTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "gradientTransform", value: prop' value }

instance Attr RadialGradient_ GradientTransform (NonEmpty.NonEmpty Event.Event  String ) where
  attr GradientTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientTransform", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gradientTransform", value: prop' value }
    )
instance Attr RadialGradient_ GradientTransform  String  where
  attr GradientTransform value = unsafeAttribute $ This $ pure $
    { key: "gradientTransform", value: prop' value }
instance Attr RadialGradient_ GradientTransform (Event.Event  String ) where
  attr GradientTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "gradientTransform", value: prop' value }

instance Attr everything GradientTransform (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr GradientTransform bothValues = unsafeAttribute $ Both (pure 
    { key: "gradientTransform", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "gradientTransform", value: unset' })
instance Attr everything GradientTransform  Unit  where
  attr GradientTransform _ = unsafeAttribute $ This $ pure $
    { key: "gradientTransform", value: unset' }
instance Attr everything GradientTransform (Event.Event  Unit ) where
  attr GradientTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "gradientTransform", value: unset' }
