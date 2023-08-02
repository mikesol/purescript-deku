module Deku.DOM.Attr.D where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Path (Path_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data D = D

instance Attr Path_ D (NonEmpty.NonEmpty Event.Event  String ) where
  attr D bothValues = unsafeAttribute $ Both
    { key: "d", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "d", value: prop' value })
instance Attr Path_ D  String  where
  attr D value = unsafeAttribute $ This { key: "d", value: prop' value }
instance Attr Path_ D (Event.Event  String ) where
  attr D eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "d", value: prop' value }

instance Attr everything D (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr D bothValues = unsafeAttribute $ Both { key: "d", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "d", value: unset' })
instance Attr everything D  Unit  where
  attr D _ = unsafeAttribute $ This { key: "d", value: unset' }
instance Attr everything D (Event.Event  Unit ) where
  attr D eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "d", value: unset' }
