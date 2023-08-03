module Deku.DOM.Attr.Data where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Object (Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Data = Data

instance Attr Object_ Data (NonEmpty.NonEmpty Event.Event  String ) where
  attr Data bothValues = unsafeAttribute $ Both (pure 
    { key: "data", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "data", value: prop' value })
instance Attr Object_ Data  String  where
  attr Data value = unsafeAttribute $ This $ pure $
    { key: "data", value: prop' value }
instance Attr Object_ Data (Event.Event  String ) where
  attr Data eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "data", value: prop' value }

instance Attr everything Data (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Data bothValues = unsafeAttribute $ Both (pure  { key: "data", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "data", value: unset' })
instance Attr everything Data  Unit  where
  attr Data _ = unsafeAttribute $ This $ pure $ { key: "data", value: unset' }
instance Attr everything Data (Event.Event  Unit ) where
  attr Data eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "data", value: unset' }
