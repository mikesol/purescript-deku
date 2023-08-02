module Deku.DOM.Attr.Mode where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Mode = Mode

instance Attr FeBlend_ Mode (NonEmpty.NonEmpty Event.Event  String ) where
  attr Mode bothValues = unsafeAttribute $ Both
    { key: "mode", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "mode", value: prop' value })
instance Attr FeBlend_ Mode  String  where
  attr Mode value = unsafeAttribute $ This
    { key: "mode", value: prop' value }
instance Attr FeBlend_ Mode (Event.Event  String ) where
  attr Mode eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "mode", value: prop' value }

instance Attr everything Mode (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Mode bothValues = unsafeAttribute $ Both { key: "mode", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "mode", value: unset' })
instance Attr everything Mode  Unit  where
  attr Mode _ = unsafeAttribute $ This { key: "mode", value: unset' }
instance Attr everything Mode (Event.Event  Unit ) where
  attr Mode eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "mode", value: unset' }