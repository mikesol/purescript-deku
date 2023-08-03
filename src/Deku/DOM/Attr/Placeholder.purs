module Deku.DOM.Attr.Placeholder where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Placeholder = Placeholder

instance Attr Input_ Placeholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr Placeholder bothValues = unsafeAttribute $ Both
    { key: "placeholder", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "placeholder", value: prop' value })
instance Attr Input_ Placeholder  String  where
  attr Placeholder value = unsafeAttribute $ This $ pure $
    { key: "placeholder", value: prop' value }
instance Attr Input_ Placeholder (Event.Event  String ) where
  attr Placeholder eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "placeholder", value: prop' value }

instance Attr Textarea_ Placeholder (NonEmpty.NonEmpty Event.Event  String ) where
  attr Placeholder bothValues = unsafeAttribute $ Both
    { key: "placeholder", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "placeholder", value: prop' value })
instance Attr Textarea_ Placeholder  String  where
  attr Placeholder value = unsafeAttribute $ This $ pure $
    { key: "placeholder", value: prop' value }
instance Attr Textarea_ Placeholder (Event.Event  String ) where
  attr Placeholder eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "placeholder", value: prop' value }

instance Attr everything Placeholder (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Placeholder bothValues = unsafeAttribute $ Both
    { key: "placeholder", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "placeholder", value: unset' })
instance Attr everything Placeholder  Unit  where
  attr Placeholder _ = unsafeAttribute $ This $ pure $
    { key: "placeholder", value: unset' }
instance Attr everything Placeholder (Event.Event  Unit ) where
  attr Placeholder eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "placeholder", value: unset' }
