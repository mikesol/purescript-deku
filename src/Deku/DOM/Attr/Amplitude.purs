module Deku.DOM.Attr.Amplitude where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Amplitude = Amplitude

instance Attr FeFuncA_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncA_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This
    { key: "amplitude", value: prop' value }
instance Attr FeFuncA_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncB_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncB_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This
    { key: "amplitude", value: prop' value }
instance Attr FeFuncB_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncG_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncG_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This
    { key: "amplitude", value: prop' value }
instance Attr FeFuncG_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr FeFuncR_ Amplitude (NonEmpty.NonEmpty Event.Event  String ) where
  attr Amplitude bothValues = unsafeAttribute $ Both
    { key: "amplitude", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "amplitude", value: prop' value })
instance Attr FeFuncR_ Amplitude  String  where
  attr Amplitude value = unsafeAttribute $ This
    { key: "amplitude", value: prop' value }
instance Attr FeFuncR_ Amplitude (Event.Event  String ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "amplitude", value: prop' value }

instance Attr everything Amplitude (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Amplitude bothValues = unsafeAttribute $ Both
    { key: "amplitude", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "amplitude", value: unset' })
instance Attr everything Amplitude  Unit  where
  attr Amplitude _ = unsafeAttribute $ This
    { key: "amplitude", value: unset' }
instance Attr everything Amplitude (Event.Event  Unit ) where
  attr Amplitude eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "amplitude", value: unset' }