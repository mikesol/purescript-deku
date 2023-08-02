module Deku.DOM.Attr.Restart where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Restart = Restart

instance Attr Animate_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both
    { key: "restart", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr Animate_ Restart  String  where
  attr Restart value = unsafeAttribute $ This
    { key: "restart", value: prop' value }
instance Attr Animate_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr AnimateMotion_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both
    { key: "restart", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr AnimateMotion_ Restart  String  where
  attr Restart value = unsafeAttribute $ This
    { key: "restart", value: prop' value }
instance Attr AnimateMotion_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr AnimateTransform_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both
    { key: "restart", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr AnimateTransform_ Restart  String  where
  attr Restart value = unsafeAttribute $ This
    { key: "restart", value: prop' value }
instance Attr AnimateTransform_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr Set_ Restart (NonEmpty.NonEmpty Event.Event  String ) where
  attr Restart bothValues = unsafeAttribute $ Both
    { key: "restart", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "restart", value: prop' value })
instance Attr Set_ Restart  String  where
  attr Restart value = unsafeAttribute $ This
    { key: "restart", value: prop' value }
instance Attr Set_ Restart (Event.Event  String ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "restart", value: prop' value }

instance Attr everything Restart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Restart bothValues = unsafeAttribute $ Both
    { key: "restart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "restart", value: unset' })
instance Attr everything Restart  Unit  where
  attr Restart _ = unsafeAttribute $ This { key: "restart", value: unset' }
instance Attr everything Restart (Event.Event  Unit ) where
  attr Restart eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "restart", value: unset' }
