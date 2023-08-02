module Deku.DOM.Attr.Min where

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
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Min = Min

instance Attr Input_ Min (NonEmpty.NonEmpty Event.Event  String ) where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "min", value: prop' value })
instance Attr Input_ Min  String  where
  attr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
instance Attr Input_ Min (Event.Event  String ) where
  attr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr Meter_ Min (NonEmpty.NonEmpty Event.Event  String ) where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "min", value: prop' value })
instance Attr Meter_ Min  String  where
  attr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
instance Attr Meter_ Min (Event.Event  String ) where
  attr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr Animate_ Min (NonEmpty.NonEmpty Event.Event  String ) where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "min", value: prop' value })
instance Attr Animate_ Min  String  where
  attr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
instance Attr Animate_ Min (Event.Event  String ) where
  attr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr AnimateMotion_ Min (NonEmpty.NonEmpty Event.Event  String ) where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "min", value: prop' value })
instance Attr AnimateMotion_ Min  String  where
  attr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
instance Attr AnimateMotion_ Min (Event.Event  String ) where
  attr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr AnimateTransform_ Min (NonEmpty.NonEmpty Event.Event  String ) where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "min", value: prop' value })
instance Attr AnimateTransform_ Min  String  where
  attr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
instance Attr AnimateTransform_ Min (Event.Event  String ) where
  attr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr Set_ Min (NonEmpty.NonEmpty Event.Event  String ) where
  attr Min bothValues = unsafeAttribute $ Both
    { key: "min", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "min", value: prop' value })
instance Attr Set_ Min  String  where
  attr Min value = unsafeAttribute $ This { key: "min", value: prop' value }
instance Attr Set_ Min (Event.Event  String ) where
  attr Min eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "min", value: prop' value }

instance Attr everything Min (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Min bothValues = unsafeAttribute $ Both { key: "min", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "min", value: unset' })
instance Attr everything Min  Unit  where
  attr Min _ = unsafeAttribute $ This { key: "min", value: unset' }
instance Attr everything Min (Event.Event  Unit ) where
  attr Min eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "min", value: unset' }
