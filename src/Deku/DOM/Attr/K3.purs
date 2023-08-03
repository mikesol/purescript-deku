module Deku.DOM.Attr.K3 where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K3 = K3

instance Attr FeComposite_ K3 (NonEmpty.NonEmpty Event.Event  String ) where
  attr K3 bothValues = unsafeAttribute $ Both (pure 
    { key: "k3", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "k3", value: prop' value })
instance Attr FeComposite_ K3  String  where
  attr K3 value = unsafeAttribute $ This $ pure $ { key: "k3", value: prop' value }
instance Attr FeComposite_ K3 (Event.Event  String ) where
  attr K3 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k3", value: prop' value }

instance Attr everything K3 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr K3 bothValues = unsafeAttribute $ Both (pure  { key: "k3", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "k3", value: unset' })
instance Attr everything K3  Unit  where
  attr K3 _ = unsafeAttribute $ This $ pure $ { key: "k3", value: unset' }
instance Attr everything K3 (Event.Event  Unit ) where
  attr K3 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k3", value: unset' }
