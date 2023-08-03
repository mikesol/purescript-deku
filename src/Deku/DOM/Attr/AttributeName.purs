module Deku.DOM.Attr.AttributeName where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeName = AttributeName

instance Attr Animate_ AttributeName (NonEmpty.NonEmpty Event.Event  String ) where
  attr AttributeName bothValues = unsafeAttribute $ Both (pure 
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
instance Attr Animate_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ This $ pure $
    { key: "attributeName", value: prop' value }
instance Attr Animate_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr AnimateMotion_ AttributeName (NonEmpty.NonEmpty Event.Event  String ) where
  attr AttributeName bothValues = unsafeAttribute $ Both (pure 
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
instance Attr AnimateMotion_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ This $ pure $
    { key: "attributeName", value: prop' value }
instance Attr AnimateMotion_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr AnimateTransform_ AttributeName (NonEmpty.NonEmpty Event.Event  String ) where
  attr AttributeName bothValues = unsafeAttribute $ Both (pure 
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
instance Attr AnimateTransform_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ This $ pure $
    { key: "attributeName", value: prop' value }
instance Attr AnimateTransform_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr Set_ AttributeName (NonEmpty.NonEmpty Event.Event  String ) where
  attr AttributeName bothValues = unsafeAttribute $ Both (pure 
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
instance Attr Set_ AttributeName  String  where
  attr AttributeName value = unsafeAttribute $ This $ pure $
    { key: "attributeName", value: prop' value }
instance Attr Set_ AttributeName (Event.Event  String ) where
  attr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr everything AttributeName (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr AttributeName bothValues = unsafeAttribute $ Both (pure 
    { key: "attributeName", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "attributeName", value: unset' })
instance Attr everything AttributeName  Unit  where
  attr AttributeName _ = unsafeAttribute $ This $ pure $
    { key: "attributeName", value: unset' }
instance Attr everything AttributeName (Event.Event  Unit ) where
  attr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "attributeName", value: unset' }
