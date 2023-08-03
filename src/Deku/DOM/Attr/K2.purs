module Deku.DOM.Attr.K2 where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K2 = K2

instance Attr FeComposite_ K2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr K2 bothValues = unsafeAttribute $ Both (pure 
    { key: "k2", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "k2", value: prop' value })
instance Attr FeComposite_ K2  String  where
  attr K2 value = unsafeAttribute $ This $ pure $ { key: "k2", value: prop' value }
instance Attr FeComposite_ K2 (Event.Event  String ) where
  attr K2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k2", value: prop' value }

instance Attr everything K2 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr K2 bothValues = unsafeAttribute $ Both (pure  { key: "k2", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "k2", value: unset' })
instance Attr everything K2  Unit  where
  attr K2 _ = unsafeAttribute $ This $ pure $ { key: "k2", value: unset' }
instance Attr everything K2 (Event.Event  Unit ) where
  attr K2 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k2", value: unset' }
