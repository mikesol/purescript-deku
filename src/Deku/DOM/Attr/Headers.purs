module Deku.DOM.Attr.Headers where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Headers = Headers

instance Attr Td_ Headers (NonEmpty.NonEmpty Event.Event  String ) where
  attr Headers bothValues = unsafeAttribute $ Both
    { key: "headers", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "headers", value: prop' value })
instance Attr Td_ Headers  String  where
  attr Headers value = unsafeAttribute $ This
    { key: "headers", value: prop' value }
instance Attr Td_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr Th_ Headers (NonEmpty.NonEmpty Event.Event  String ) where
  attr Headers bothValues = unsafeAttribute $ Both
    { key: "headers", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "headers", value: prop' value })
instance Attr Th_ Headers  String  where
  attr Headers value = unsafeAttribute $ This
    { key: "headers", value: prop' value }
instance Attr Th_ Headers (Event.Event  String ) where
  attr Headers eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr everything Headers (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Headers bothValues = unsafeAttribute $ Both
    { key: "headers", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "headers", value: unset' })
instance Attr everything Headers  Unit  where
  attr Headers _ = unsafeAttribute $ This { key: "headers", value: unset' }
instance Attr everything Headers (Event.Event  Unit ) where
  attr Headers eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "headers", value: unset' }
