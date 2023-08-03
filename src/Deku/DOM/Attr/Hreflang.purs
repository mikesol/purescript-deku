module Deku.DOM.Attr.Hreflang where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Hreflang = Hreflang

instance Attr A_ Hreflang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hreflang bothValues = unsafeAttribute $ Both
    { key: "hreflang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hreflang", value: prop' value })
instance Attr A_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute $ This $ pure $
    { key: "hreflang", value: prop' value }
instance Attr A_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hreflang", value: prop' value }

instance Attr Area_ Hreflang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hreflang bothValues = unsafeAttribute $ Both
    { key: "hreflang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hreflang", value: prop' value })
instance Attr Area_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute $ This $ pure $
    { key: "hreflang", value: prop' value }
instance Attr Area_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hreflang", value: prop' value }

instance Attr Link_ Hreflang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Hreflang bothValues = unsafeAttribute $ Both
    { key: "hreflang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "hreflang", value: prop' value })
instance Attr Link_ Hreflang  String  where
  attr Hreflang value = unsafeAttribute $ This $ pure $
    { key: "hreflang", value: prop' value }
instance Attr Link_ Hreflang (Event.Event  String ) where
  attr Hreflang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "hreflang", value: prop' value }

instance Attr everything Hreflang (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Hreflang bothValues = unsafeAttribute $ Both
    { key: "hreflang", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "hreflang", value: unset' })
instance Attr everything Hreflang  Unit  where
  attr Hreflang _ = unsafeAttribute $ This $ pure $
    { key: "hreflang", value: unset' }
instance Attr everything Hreflang (Event.Event  Unit ) where
  attr Hreflang eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "hreflang", value: unset' }
