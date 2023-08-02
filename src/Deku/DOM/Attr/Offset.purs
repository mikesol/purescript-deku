module Deku.DOM.Attr.Offset where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Offset = Offset

instance Attr FeFuncA_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncA_ Offset  String  where
  attr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
instance Attr FeFuncA_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncB_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncB_ Offset  String  where
  attr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
instance Attr FeFuncB_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncG_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncG_ Offset  String  where
  attr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
instance Attr FeFuncG_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncR_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr FeFuncR_ Offset  String  where
  attr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
instance Attr FeFuncR_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr Stop_ Offset (NonEmpty.NonEmpty Event.Event  String ) where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
instance Attr Stop_ Offset  String  where
  attr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
instance Attr Stop_ Offset (Event.Event  String ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr everything Offset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "offset", value: unset' })
instance Attr everything Offset  Unit  where
  attr Offset _ = unsafeAttribute $ This { key: "offset", value: unset' }
instance Attr everything Offset (Event.Event  Unit ) where
  attr Offset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "offset", value: unset' }
