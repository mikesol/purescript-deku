module Deku.DOM.Attr.Integrity where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Integrity = Integrity

instance Attr Link_ Integrity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Integrity bothValues = unsafeAttribute $ Both
    { key: "integrity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "integrity", value: prop' value })
instance Attr Link_ Integrity  String  where
  attr Integrity value = unsafeAttribute $ This $ pure $
    { key: "integrity", value: prop' value }
instance Attr Link_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "integrity", value: prop' value }

instance Attr Script_ Integrity (NonEmpty.NonEmpty Event.Event  String ) where
  attr Integrity bothValues = unsafeAttribute $ Both
    { key: "integrity", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "integrity", value: prop' value })
instance Attr Script_ Integrity  String  where
  attr Integrity value = unsafeAttribute $ This $ pure $
    { key: "integrity", value: prop' value }
instance Attr Script_ Integrity (Event.Event  String ) where
  attr Integrity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "integrity", value: prop' value }

instance Attr everything Integrity (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Integrity bothValues = unsafeAttribute $ Both
    { key: "integrity", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "integrity", value: unset' })
instance Attr everything Integrity  Unit  where
  attr Integrity _ = unsafeAttribute $ This $ pure $
    { key: "integrity", value: unset' }
instance Attr everything Integrity (Event.Event  Unit ) where
  attr Integrity eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "integrity", value: unset' }
