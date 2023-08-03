module Deku.DOM.Attr.Manifest where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Html (Html_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Manifest = Manifest

instance Attr Html_ Manifest (NonEmpty.NonEmpty Event.Event  String ) where
  attr Manifest bothValues = unsafeAttribute $ Both
    { key: "manifest", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "manifest", value: prop' value })
instance Attr Html_ Manifest  String  where
  attr Manifest value = unsafeAttribute $ This $ pure $
    { key: "manifest", value: prop' value }
instance Attr Html_ Manifest (Event.Event  String ) where
  attr Manifest eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "manifest", value: prop' value }

instance Attr everything Manifest (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Manifest bothValues = unsafeAttribute $ Both
    { key: "manifest", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "manifest", value: unset' })
instance Attr everything Manifest  Unit  where
  attr Manifest _ = unsafeAttribute $ This $ pure $
    { key: "manifest", value: unset' }
instance Attr everything Manifest (Event.Event  Unit ) where
  attr Manifest eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "manifest", value: unset' }
