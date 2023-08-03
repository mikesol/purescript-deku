module Deku.DOM.Attr.Allow where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Allow = Allow

instance Attr Iframe_ Allow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Allow bothValues = unsafeAttribute $ Both
    { key: "allow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "allow", value: prop' value })
instance Attr Iframe_ Allow  String  where
  attr Allow value = unsafeAttribute $ This $ pure $
    { key: "allow", value: prop' value }
instance Attr Iframe_ Allow (Event.Event  String ) where
  attr Allow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "allow", value: prop' value }

instance Attr everything Allow (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Allow bothValues = unsafeAttribute $ Both { key: "allow", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "allow", value: unset' })
instance Attr everything Allow  Unit  where
  attr Allow _ = unsafeAttribute $ This $ pure $ { key: "allow", value: unset' }
instance Attr everything Allow (Event.Event  Unit ) where
  attr Allow eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "allow", value: unset' }
