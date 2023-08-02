module Deku.DOM.Attr.From where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data From = From

instance Attr Animate_ From (NonEmpty.NonEmpty Event.Event  String ) where
  attr From bothValues = unsafeAttribute $ Both
    { key: "from", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr Animate_ From  String  where
  attr From value = unsafeAttribute $ This
    { key: "from", value: prop' value }
instance Attr Animate_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr AnimateMotion_ From (NonEmpty.NonEmpty Event.Event  String ) where
  attr From bothValues = unsafeAttribute $ Both
    { key: "from", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr AnimateMotion_ From  String  where
  attr From value = unsafeAttribute $ This
    { key: "from", value: prop' value }
instance Attr AnimateMotion_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr AnimateTransform_ From (NonEmpty.NonEmpty Event.Event  String ) where
  attr From bothValues = unsafeAttribute $ Both
    { key: "from", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "from", value: prop' value })
instance Attr AnimateTransform_ From  String  where
  attr From value = unsafeAttribute $ This
    { key: "from", value: prop' value }
instance Attr AnimateTransform_ From (Event.Event  String ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "from", value: prop' value }

instance Attr everything From (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr From bothValues = unsafeAttribute $ Both { key: "from", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "from", value: unset' })
instance Attr everything From  Unit  where
  attr From _ = unsafeAttribute $ This { key: "from", value: unset' }
instance Attr everything From (Event.Event  Unit ) where
  attr From eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "from", value: unset' }
