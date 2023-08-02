module Deku.DOM.Attr.Max where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Max = Max

instance Attr Input_ Max (NonEmpty.NonEmpty Event.Event  String ) where
  attr Max bothValues = unsafeAttribute $ Both
    { key: "max", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "max", value: prop' value })
instance Attr Input_ Max  String  where
  attr Max value = unsafeAttribute $ This { key: "max", value: prop' value }
instance Attr Input_ Max (Event.Event  String ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "max", value: prop' value }

instance Attr Meter_ Max (NonEmpty.NonEmpty Event.Event  String ) where
  attr Max bothValues = unsafeAttribute $ Both
    { key: "max", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "max", value: prop' value })
instance Attr Meter_ Max  String  where
  attr Max value = unsafeAttribute $ This { key: "max", value: prop' value }
instance Attr Meter_ Max (Event.Event  String ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "max", value: prop' value }

instance Attr Progress_ Max (NonEmpty.NonEmpty Event.Event  String ) where
  attr Max bothValues = unsafeAttribute $ Both
    { key: "max", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "max", value: prop' value })
instance Attr Progress_ Max  String  where
  attr Max value = unsafeAttribute $ This { key: "max", value: prop' value }
instance Attr Progress_ Max (Event.Event  String ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "max", value: prop' value }

instance Attr Animate_ Max (NonEmpty.NonEmpty Event.Event  String ) where
  attr Max bothValues = unsafeAttribute $ Both
    { key: "max", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "max", value: prop' value })
instance Attr Animate_ Max  String  where
  attr Max value = unsafeAttribute $ This { key: "max", value: prop' value }
instance Attr Animate_ Max (Event.Event  String ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "max", value: prop' value }

instance Attr AnimateMotion_ Max (NonEmpty.NonEmpty Event.Event  String ) where
  attr Max bothValues = unsafeAttribute $ Both
    { key: "max", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "max", value: prop' value })
instance Attr AnimateMotion_ Max  String  where
  attr Max value = unsafeAttribute $ This { key: "max", value: prop' value }
instance Attr AnimateMotion_ Max (Event.Event  String ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "max", value: prop' value }

instance Attr AnimateTransform_ Max (NonEmpty.NonEmpty Event.Event  String ) where
  attr Max bothValues = unsafeAttribute $ Both
    { key: "max", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "max", value: prop' value })
instance Attr AnimateTransform_ Max  String  where
  attr Max value = unsafeAttribute $ This { key: "max", value: prop' value }
instance Attr AnimateTransform_ Max (Event.Event  String ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "max", value: prop' value }

instance Attr Set_ Max (NonEmpty.NonEmpty Event.Event  String ) where
  attr Max bothValues = unsafeAttribute $ Both
    { key: "max", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "max", value: prop' value })
instance Attr Set_ Max  String  where
  attr Max value = unsafeAttribute $ This { key: "max", value: prop' value }
instance Attr Set_ Max (Event.Event  String ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "max", value: prop' value }

instance Attr everything Max (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Max bothValues = unsafeAttribute $ Both { key: "max", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "max", value: unset' })
instance Attr everything Max  Unit  where
  attr Max _ = unsafeAttribute $ This { key: "max", value: unset' }
instance Attr everything Max (Event.Event  Unit ) where
  attr Max eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "max", value: unset' }
