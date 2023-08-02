module Deku.DOM.Attr.Scoped where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scoped = Scoped

instance Attr Style_ Scoped (NonEmpty.NonEmpty Event.Event  String ) where
  attr Scoped bothValues = unsafeAttribute $ Both
    { key: "scoped", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "scoped", value: prop' value })
instance Attr Style_ Scoped  String  where
  attr Scoped value = unsafeAttribute $ This
    { key: "scoped", value: prop' value }
instance Attr Style_ Scoped (Event.Event  String ) where
  attr Scoped eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scoped", value: prop' value }

instance Attr everything Scoped (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Scoped bothValues = unsafeAttribute $ Both
    { key: "scoped", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "scoped", value: unset' })
instance Attr everything Scoped  Unit  where
  attr Scoped _ = unsafeAttribute $ This { key: "scoped", value: unset' }
instance Attr everything Scoped (Event.Event  Unit ) where
  attr Scoped eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scoped", value: unset' }
