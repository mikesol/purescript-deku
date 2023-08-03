module Deku.DOM.Attr.Readonly where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Readonly = Readonly

instance Attr Input_ Readonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr Readonly bothValues = unsafeAttribute $ Both
    { key: "readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "readonly", value: prop' value })
instance Attr Input_ Readonly  String  where
  attr Readonly value = unsafeAttribute $ This $ pure $
    { key: "readonly", value: prop' value }
instance Attr Input_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "readonly", value: prop' value }

instance Attr Textarea_ Readonly (NonEmpty.NonEmpty Event.Event  String ) where
  attr Readonly bothValues = unsafeAttribute $ Both
    { key: "readonly", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "readonly", value: prop' value })
instance Attr Textarea_ Readonly  String  where
  attr Readonly value = unsafeAttribute $ This $ pure $
    { key: "readonly", value: prop' value }
instance Attr Textarea_ Readonly (Event.Event  String ) where
  attr Readonly eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "readonly", value: prop' value }

instance Attr everything Readonly (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Readonly bothValues = unsafeAttribute $ Both
    { key: "readonly", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "readonly", value: unset' })
instance Attr everything Readonly  Unit  where
  attr Readonly _ = unsafeAttribute $ This $ pure $
    { key: "readonly", value: unset' }
instance Attr everything Readonly (Event.Event  Unit ) where
  attr Readonly eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "readonly", value: unset' }
