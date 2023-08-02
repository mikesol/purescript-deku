module Deku.DOM.Attr.Slope where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Slope = Slope

instance Attr FeFuncA_ Slope (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slope bothValues = unsafeAttribute $ Both
    { key: "slope", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "slope", value: prop' value })
instance Attr FeFuncA_ Slope  String  where
  attr Slope value = unsafeAttribute $ This
    { key: "slope", value: prop' value }
instance Attr FeFuncA_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slope", value: prop' value }

instance Attr FeFuncB_ Slope (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slope bothValues = unsafeAttribute $ Both
    { key: "slope", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "slope", value: prop' value })
instance Attr FeFuncB_ Slope  String  where
  attr Slope value = unsafeAttribute $ This
    { key: "slope", value: prop' value }
instance Attr FeFuncB_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slope", value: prop' value }

instance Attr FeFuncG_ Slope (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slope bothValues = unsafeAttribute $ Both
    { key: "slope", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "slope", value: prop' value })
instance Attr FeFuncG_ Slope  String  where
  attr Slope value = unsafeAttribute $ This
    { key: "slope", value: prop' value }
instance Attr FeFuncG_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slope", value: prop' value }

instance Attr FeFuncR_ Slope (NonEmpty.NonEmpty Event.Event  String ) where
  attr Slope bothValues = unsafeAttribute $ Both
    { key: "slope", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "slope", value: prop' value })
instance Attr FeFuncR_ Slope  String  where
  attr Slope value = unsafeAttribute $ This
    { key: "slope", value: prop' value }
instance Attr FeFuncR_ Slope (Event.Event  String ) where
  attr Slope eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "slope", value: prop' value }

instance Attr everything Slope (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Slope bothValues = unsafeAttribute $ Both { key: "slope", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "slope", value: unset' })
instance Attr everything Slope  Unit  where
  attr Slope _ = unsafeAttribute $ This { key: "slope", value: unset' }
instance Attr everything Slope (Event.Event  Unit ) where
  attr Slope eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "slope", value: unset' }
