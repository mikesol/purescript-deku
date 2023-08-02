module Deku.DOM.Attr.Bgcolor where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bgcolor = Bgcolor

instance Attr Body_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Body_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Body_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Col_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Col_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Col_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Colgroup_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Colgroup_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Colgroup_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Table_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Table_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Table_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tbody_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tbody_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Tbody_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tfoot_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tfoot_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Tfoot_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Td_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Td_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Td_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Th_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Th_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Th_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr Tr_ Bgcolor (NonEmpty.NonEmpty Event.Event  String ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "bgcolor", value: prop' value })
instance Attr Tr_ Bgcolor  String  where
  attr Bgcolor value = unsafeAttribute $ This
    { key: "bgcolor", value: prop' value }
instance Attr Tr_ Bgcolor (Event.Event  String ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "bgcolor", value: prop' value }

instance Attr everything Bgcolor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Bgcolor bothValues = unsafeAttribute $ Both
    { key: "bgcolor", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "bgcolor", value: unset' })
instance Attr everything Bgcolor  Unit  where
  attr Bgcolor _ = unsafeAttribute $ This { key: "bgcolor", value: unset' }
instance Attr everything Bgcolor (Event.Event  Unit ) where
  attr Bgcolor eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "bgcolor", value: unset' }
