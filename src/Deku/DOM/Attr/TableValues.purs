module Deku.DOM.Attr.TableValues where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TableValues = TableValues

instance Attr FeFuncA_ TableValues (NonEmpty.NonEmpty Event.Event  String ) where
  attr TableValues bothValues = unsafeAttribute $ Both
    { key: "tableValues", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "tableValues", value: prop' value })
instance Attr FeFuncA_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ This
    { key: "tableValues", value: prop' value }
instance Attr FeFuncA_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }

instance Attr FeFuncB_ TableValues (NonEmpty.NonEmpty Event.Event  String ) where
  attr TableValues bothValues = unsafeAttribute $ Both
    { key: "tableValues", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "tableValues", value: prop' value })
instance Attr FeFuncB_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ This
    { key: "tableValues", value: prop' value }
instance Attr FeFuncB_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }

instance Attr FeFuncG_ TableValues (NonEmpty.NonEmpty Event.Event  String ) where
  attr TableValues bothValues = unsafeAttribute $ Both
    { key: "tableValues", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "tableValues", value: prop' value })
instance Attr FeFuncG_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ This
    { key: "tableValues", value: prop' value }
instance Attr FeFuncG_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }

instance Attr FeFuncR_ TableValues (NonEmpty.NonEmpty Event.Event  String ) where
  attr TableValues bothValues = unsafeAttribute $ Both
    { key: "tableValues", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "tableValues", value: prop' value })
instance Attr FeFuncR_ TableValues  String  where
  attr TableValues value = unsafeAttribute $ This
    { key: "tableValues", value: prop' value }
instance Attr FeFuncR_ TableValues (Event.Event  String ) where
  attr TableValues eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "tableValues", value: prop' value }

instance Attr everything TableValues (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TableValues bothValues = unsafeAttribute $ Both
    { key: "tableValues", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "tableValues", value: unset' })
instance Attr everything TableValues  Unit  where
  attr TableValues _ = unsafeAttribute $ This
    { key: "tableValues", value: unset' }
instance Attr everything TableValues (Event.Event  Unit ) where
  attr TableValues eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "tableValues", value: unset' }
