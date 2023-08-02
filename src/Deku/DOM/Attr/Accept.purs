module Deku.DOM.Attr.Accept where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accept = Accept

instance Attr Form_ Accept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accept bothValues = unsafeAttribute $ Both
    { key: "accept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accept", value: prop' value })
instance Attr Form_ Accept  String  where
  attr Accept value = unsafeAttribute $ This
    { key: "accept", value: prop' value }
instance Attr Form_ Accept (Event.Event  String ) where
  attr Accept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accept", value: prop' value }

instance Attr Input_ Accept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Accept bothValues = unsafeAttribute $ Both
    { key: "accept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accept", value: prop' value })
instance Attr Input_ Accept  String  where
  attr Accept value = unsafeAttribute $ This
    { key: "accept", value: prop' value }
instance Attr Input_ Accept (Event.Event  String ) where
  attr Accept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accept", value: prop' value }

instance Attr everything Accept (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Accept bothValues = unsafeAttribute $ Both
    { key: "accept", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "accept", value: unset' })
instance Attr everything Accept  Unit  where
  attr Accept _ = unsafeAttribute $ This { key: "accept", value: unset' }
instance Attr everything Accept (Event.Event  Unit ) where
  attr Accept eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "accept", value: unset' }
