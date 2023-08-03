module Deku.DOM.Attr.Additive where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Additive = Additive

instance Attr Animate_ Additive (NonEmpty.NonEmpty Event.Event  String ) where
  attr Additive bothValues = unsafeAttribute $ Both
    { key: "additive", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr Animate_ Additive  String  where
  attr Additive value = unsafeAttribute $ This $ pure $
    { key: "additive", value: prop' value }
instance Attr Animate_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "additive", value: prop' value }

instance Attr AnimateMotion_ Additive (NonEmpty.NonEmpty Event.Event  String ) where
  attr Additive bothValues = unsafeAttribute $ Both
    { key: "additive", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr AnimateMotion_ Additive  String  where
  attr Additive value = unsafeAttribute $ This $ pure $
    { key: "additive", value: prop' value }
instance Attr AnimateMotion_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "additive", value: prop' value }

instance Attr AnimateTransform_ Additive (NonEmpty.NonEmpty Event.Event  String ) where
  attr Additive bothValues = unsafeAttribute $ Both
    { key: "additive", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "additive", value: prop' value })
instance Attr AnimateTransform_ Additive  String  where
  attr Additive value = unsafeAttribute $ This $ pure $
    { key: "additive", value: prop' value }
instance Attr AnimateTransform_ Additive (Event.Event  String ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "additive", value: prop' value }

instance Attr everything Additive (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Additive bothValues = unsafeAttribute $ Both
    { key: "additive", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "additive", value: unset' })
instance Attr everything Additive  Unit  where
  attr Additive _ = unsafeAttribute $ This $ pure $
    { key: "additive", value: unset' }
instance Attr everything Additive (Event.Event  Unit ) where
  attr Additive eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "additive", value: unset' }
