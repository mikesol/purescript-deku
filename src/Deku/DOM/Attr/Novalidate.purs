module Deku.DOM.Attr.Novalidate where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Novalidate = Novalidate

instance Attr Form_ Novalidate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Novalidate bothValues = unsafeAttribute $ Both
    { key: "novalidate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "novalidate", value: prop' value })
instance Attr Form_ Novalidate  String  where
  attr Novalidate value = unsafeAttribute $ This $ pure $
    { key: "novalidate", value: prop' value }
instance Attr Form_ Novalidate (Event.Event  String ) where
  attr Novalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "novalidate", value: prop' value }

instance Attr everything Novalidate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Novalidate bothValues = unsafeAttribute $ Both
    { key: "novalidate", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "novalidate", value: unset' })
instance Attr everything Novalidate  Unit  where
  attr Novalidate _ = unsafeAttribute $ This $ pure $
    { key: "novalidate", value: unset' }
instance Attr everything Novalidate (Event.Event  Unit ) where
  attr Novalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "novalidate", value: unset' }
