module Deku.DOM.Attr.K1 where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K1 = K1

instance Attr FeComposite_ K1 (NonEmpty.NonEmpty Event.Event  String ) where
  attr K1 bothValues = unsafeAttribute $ Both
    { key: "k1", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "k1", value: prop' value })
instance Attr FeComposite_ K1  String  where
  attr K1 value = unsafeAttribute $ This { key: "k1", value: prop' value }
instance Attr FeComposite_ K1 (Event.Event  String ) where
  attr K1 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k1", value: prop' value }

instance Attr everything K1 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr K1 bothValues = unsafeAttribute $ Both { key: "k1", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "k1", value: unset' })
instance Attr everything K1  Unit  where
  attr K1 _ = unsafeAttribute $ This { key: "k1", value: unset' }
instance Attr everything K1 (Event.Event  Unit ) where
  attr K1 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k1", value: unset' }
